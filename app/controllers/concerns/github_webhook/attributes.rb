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

    def provided_signature
      request.headers['HTTP_X_HUB_SIGNATURE']
    end

    def payload
      JSON.parse(params[:payload])
    end
  end
end
