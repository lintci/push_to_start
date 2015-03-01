require 'spec_helper'

describe PayloadsController do
  describe 'POST create' do
    let(:token){build(:token)}
    let(:event_id){build(:event_id)}

    around(:each) do |example|
      old_token = Rails.application.secrets.github_webhook_token
      Rails.application.secrets.github_webhook_token = token

      example.run

      Rails.application.secrets.github_webhook_token = old_token
    end

    before(:each) do
      request.headers['content-type'] = 'application/x-www-form-urlencoded'
      request.headers['X-GitHub-Delivery'] = event_id
      request.headers['X-GitHub-Event'] = event
      request.headers['X-Hub-Signature'] = signature
    end

    context 'when the request is unauthenticated' do
      let(:event){build(:pull_request_event)}
      let(:signature){'123'}
      let(:raw_payload){build(:raw_pull_request_reopened_payload)}

      it 'responds with unauthorized' do
        post :create, payload: raw_payload

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request is a ping' do
      let(:event){build(:ping_event)}
      let(:signature){build(:ping_signature)}
      let(:raw_payload){build(:raw_ping_payload)}

      it 'responds with ok' do
        post :create, payload: raw_payload

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is something other than ping' do
      let(:event){build(:pull_request_event)}
      let(:signature){build(:pull_request_reopened_signature)}
      let(:raw_payload){build(:raw_pull_request_reopened_payload)}
      let(:payload){build(:payload)}

      it 'responds with ok and enqueues the payload' do
        expect(ProcessGithubEvent).to receive(:call).with(event, event_id, payload)

        post :create, payload: raw_payload

        expect(response).to have_http_status(:created)
      end
    end
  end
end
