require 'spec_helper'

describe ProcessGithubEvent do
  let(:event){build(:event)}
  let(:event_id){build(:event_id)}
  let(:payload){build(:payload)}
  let(:github_event){build(:github_event)}
  subject(:service){ProcessGithubEvent.new(event, event_id, payload)}

  describe '#call' do
    let(:event_job){PayloadReceivedWorker.jobs.first}

    it 'enqueues the payload received event' do
      service.call

      expect(event_job['args']).to eq([github_event.as_json])
    end
  end
end
