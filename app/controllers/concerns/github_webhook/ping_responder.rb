module GithubWebhook
  # Responds to ping webhooks from Github
  module PingResponder
    extend ActiveSupport::Concern

    included do
      before_action :respond_to_ping
    end

  private

    def respond_to_ping
      return unless ping?

      head :ok
    end

    def ping?
      request.headers['X-Github-Event'] == 'ping'
    end
  end
end
