class RealStoryReplyController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  
  def create
    puts "@@@@@@@@@@@@"
    puts params[:real_story_id]
    puts params[:content]
    @reply = Reply.create(post_id: params[:real_story_id], user_id: current_user.id, content: params[:content])
    @reply.save
  
    @user = User.find(@reply.user_id)
    @rev = {:reply => @reply, :user => @user} 
      # render :json => @reply 
      render json: @rev
    # if @reply.save
    #   respond_to do |format|
    #     format.js
    #   end
    # else
    # end
    # :back은 이전 화면으로 돌아가는 것
    # redirect_to :back
  end

  def destroy
    @reply = Reply.find(params[:id])
    
    
    if current_user.id == @reply.user_id
      @reply.destroy
    end
    redirect_to :back
  end
end
