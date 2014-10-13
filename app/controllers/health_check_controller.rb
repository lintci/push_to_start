# Provides action to hit to see if app is responding
class HealthCheckController < ActionController::Base
  def index
    head :ok
  end
end
