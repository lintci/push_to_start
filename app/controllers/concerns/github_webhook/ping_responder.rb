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
      event == 'ping'
    end
  end
end
