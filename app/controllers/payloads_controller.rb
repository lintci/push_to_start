# Receives GitHub webhooks and enqueues them to be worked on
class PayloadsController < ActionController::Base
  include GithubWebhook::Attributes
  include GithubWebhook::Authentication
  include GithubWebhook::Logging
  include GithubWebhook::PingResponder

  def create
    PayloadReceivedEvent.perform_later(event, payload)
    File.open(Rails.root.join('log/heroku.txt'), 'w'){|f| f.write(raw_payload)}
    head :created
  end
end
