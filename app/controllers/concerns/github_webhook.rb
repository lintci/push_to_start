# Provides support for responding to Github webhooks
module GithubWebhook
  include Attributes
  include Logging
  include Authentication
  include PingResponder
end
