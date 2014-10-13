# Receives GitHub webhooks and enqueues them to be worked on
class PayloadsController < ActionController::Base
  include GithubWebhook::Attributes
  include GithubWebhook::Authentication
  include GithubWebhook::Logging
  include GithubWebhook::PingResponder

  def create
    logger.info request.headers.inspect
    logger.info params.inspect
    PayloadReceivedEvent.perform_later(event, payload)

    head :ok
  end
end
