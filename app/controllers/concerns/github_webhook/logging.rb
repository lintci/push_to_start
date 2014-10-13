module GithubWebhook
  # Logs events received
  module Logging
    extend ActiveSupport::Concern

    included do
      before_action :log_request
    end

  private

    def log_request
      logger.info "Received event #{event} (#{event_id})"
    end
  end
end
