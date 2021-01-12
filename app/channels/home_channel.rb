class HomeChannel < ApplicationCable::Channel

    def subscribed
        stream_from 'loan'
    end

    def unsubscribed
        stop_all_streams
    end
end