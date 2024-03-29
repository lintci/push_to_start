# Event enqueued when a payload is received
class PayloadReceivedWorker
  include Sidekiq::Worker

  sidekiq_options queue: :laundry, backtrace: true

  def perform(_event, _payload)
    # Runs on laundromat
  end
end
