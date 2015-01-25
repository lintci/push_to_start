module GithubWebhook
  # Accessors for properties provided in a Github webhook request
  module Attributes
    extend ActiveSupport::Concern

  private

    def event
      request.headers['X-Github-Event']
    end

    def event_id
      request.headers['X-GitHub-Delivery']
    end

    def repo
      payload.fetch('repository', {}).fetch('full_name')
    end

    def provided_signature
      request.headers['X-Hub-Signature'] || ''
    end

    def raw_payload
      @raw_payload ||= request.body.read
    end

    def payload
      JSON.parse(params[:payload])
    end
  end
end
