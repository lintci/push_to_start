require 'github_authenticator'

module GithubWebhook
  # Handles authentication of Github Webhooks
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_request
    end

    def authenticate_request
      token = Rails.application.secrets.github_webhook_token
      payload = request.body.read
      signature = request.headers['X-Hub-Signature'] || ''

      authenticator = GithubAuthenticator.new(token)

      unless authenticator.authenticated?(payload, signature)
        logger.warn(message: 'Unauthenticated request')

        head :unauthorized
      end
    end
  end
end
