class SupplementChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'supplement_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
