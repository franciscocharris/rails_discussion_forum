class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion
  before_action :set_reply, only: %i[edit update show destroy]

  def new
  end

  def create
    @reply = @discussion.replies.new(reply_params)
    @reply.user_id = current_user.id
    redirect_to @discussion if @reply.save
  end

  def edit
  end

  def update
    return render :edit, status: :unprocessable_entity unless @reply

  def destroy
    redirect_to @discussion, notice: 'Reply was successfully deleted' if @reply.destroy
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end