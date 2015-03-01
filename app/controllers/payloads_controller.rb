# Receives GitHub webhooks and enqueues them to be worked on
class PayloadsController < ActionController::Base
  include GithubWebhook::Authentication
  include GithubWebhook::PingResponder

  def create
    ProcessGithubEvent.call(event, event_id, payload)

    head :created
  end

private

  def event
    request.headers['X-Github-Event']
  end

  def event_id
    request.headers['X-GitHub-Delivery']
  end

  def payload
    JSON.parse(params[:payload])
  end
end
