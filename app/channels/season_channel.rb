class SeasonChannel < ApplicationCable::Channel
  def subscribed
    stream_from "season_channel_#{params[:season_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
