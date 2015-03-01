class ProcessGithubEvent
  class << self
    def call(*args)
      new(*args).call
    end
  end

  def initialize(event, event_id, payload)
    @event = GithubEvent.new(event, event_id, payload)
  end

  def call
    enqueue_payload_for_processing
  end

protected
  attr_reader :event

private

  def enqueue_payload_for_processing
    PayloadReceivedWorker.perform_async(event.as_json)
  end
end

