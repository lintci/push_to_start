module GithubWebhook
  # Logs events received
  module Logging
    extend ActiveSupport::Concern

    included do
      before_action :log_request
    end

  private

    def log_request
      logger.info(event: event, event_id: event_id, repo: repo)
    end
  end
end
