class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show edit update destroy ]

  def index
    @channels = Channel.all
  end

  def show
    @discussions = Discussions.where('channel_id = ?', @channel.id)
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    return render :new, status: :unprocessable_entity unless @channel.save

    redirect_to @channel, notice: 'Channel was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @channel.update(channel_params)

    redirect_to @channel, notice: 'Channel was successfully updated.'
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private
    def set_channel
      @channel = Channel.find(params[:id])
    end

    def channel_params
      params.require(:channel).permit(:channel)
    end
end
