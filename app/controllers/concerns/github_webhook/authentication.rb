module GithubWebhook
  # Handles authentication of Github Webhooks
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_request
    end

    def authenticate_request
      return if Rack::Utils.secure_compare(signature, provided_signature)

      logger.warn(
        message: 'Unauthorized request',
        provided_signature: provided_signature,
        computed_signature: signature
      )

      head :unauthorized
    end

  private

    def signature
      'sha1=' + OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new('sha1'),
        Rails.application.secrets.github_webhook_token,
        raw_payload
      )
    end
  end
end
