class DiscussionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index, show]
  before_action :set_discussion, except: %i[index, create]
  before_action :menu, only: %i[index show new]

  def index
  end

  def show
  end

  def new
    @discussion = current_user.discussions.build
  end

  def create
    @discussion = discussion.new(discussion_params)
    @discussion.user_id = current_user.id
    return render :new, status: :unprocessable_entity unless @discussion.save

    redirect_to discussion_url(@discussion), notice: 'Discussion was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @discussion.update(discussion_params)

    redirect_to discussion_url(@discussion), notice: 'Discussion was successfully updated.'
  end

  def destroy
    @discussion.destroy
    redirect_to discussions_url, notice: 'Discussion was successfully deleted.'
  end

  private
  def menu
    @discussions = Discussion.all.order('created_at desc')
    @channels = Channel.all.order('created_at desc')
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content, :channel_id)
end
