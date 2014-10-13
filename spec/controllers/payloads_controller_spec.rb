require 'rails_helper'

describe PayloadsController do
  describe 'POST create' do
    let(:token){'5257771f207094a0a9a5babc94a5f6d2d3dfe619bf8199fdb9af8dc868eb2048'}

    around(:each) do |example|
      old_token = ENV['GITHUB_WEBHOOK_TOKEN']
      ENV['GITHUB_WEBHOOK_TOKEN'] = token

      example.run

      ENV['GITHUB_WEBHOOK_TOKEN'] = old_token
    end

    before(:each) do
      request.headers['content-type'] = 'application/x-www-form-urlencoded'
      request.headers['X-GitHub-Delivery'] = 'bdb6ec00-5284-11e4-8e22-6dacd62599e2'
      request.headers['X-GitHub-Event'] = event
      request.headers['X-Hub-Signature'] = signature

      post :create, payload: payload
    end

    context 'when the request is unauthenticated' do
      let(:event){'pull_request'}
      let(:signature){'123'}
      let(:payload){File.read('spec/support/fixtures/pull_request_reopened.json')}

      it 'responds with unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request is a ping' do
      let(:event){'ping'}
      let(:signature){'sha1=33018662e77cc3c938f1dd6539a95b9e5564298b'}
      let(:payload){File.read('spec/support/fixtures/ping.json')}

      it 'responds with ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is something other than ping' do
      let(:event){'pull_request'}
      let(:signature){'sha1=2cae126948b24c8010b13e7e07be9f3d23cfb0b0'}
      let(:payload){File.read('spec/support/fixtures/pull_request_reopened.json')}

      it 'responds with ok and enqueues the payload' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
