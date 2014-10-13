# Receives GitHub webhooks and enqueues them to be worked on
class PayloadsController < ActionController::Base
  include GithubWebhook

  def create
    logger.info request.headers.inspect
    logger.info params.inspect
    PayloadReceivedEvent.perform_later(event, payload)
  end
end
