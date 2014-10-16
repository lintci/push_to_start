# Receives GitHub webhooks and enqueues them to be worked on
class PayloadsController < ActionController::Base
  include GithubWebhook::Attributes
  include GithubWebhook::Authentication
  include GithubWebhook::Logging
  include GithubWebhook::PingResponder

  def create
    PayloadReceivedEvent.perform_async(event, payload)

    head :created
  end
end
