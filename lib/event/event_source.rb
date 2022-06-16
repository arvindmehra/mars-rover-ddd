module Event
  class EventSource
    attr_accessor :event_trace

    def initialize
      @event_trace = Array.new
    end

    def store_events(event)
      @event_trace << event
    end

  end
end
