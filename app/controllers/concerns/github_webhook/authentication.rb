module GithubWebhook
  # Handles authentication of Github Webhooks
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_request
    end

    def authenticate_request
      return if Rack::Utils.secure_compare(signature, provided_signature)

      logger.warn 'Unauthorized request'
      head :unauthorized
    end

  private

    def signature
      'sha1=' + OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new('sha1'),
        ENV['GITHUB_WEBHOOK_TOKEN'],
        raw_payload
      )
    end
  end
end
