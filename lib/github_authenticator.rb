class GithubAuthenticator
  def initialize(token)
    @token = token
  end

  def authenticated?(payload, provided_signature)
    Rack::Utils.secure_compare(signature(payload), provided_signature)
  end

  def signature(payload)
    'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), token, payload)
  end

protected
  attr_reader :token
end
