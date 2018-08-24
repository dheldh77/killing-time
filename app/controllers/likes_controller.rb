class LikesController < ApplicationController
  def likes_toggle
    puts "1111111111111"
    # puts "asdfasfasdfasdfasdfasdfasdfasd #{params[:post_id]}"
       like = Like.find_by(user_id: current_user.id, post_id: params[:id]) 
       @post = Post.find(params[:id])
       
       if like.nil?
         puts "@@@@@@@@@@@@@@"
           Like.create(user_id: current_user.id, post_id: params[:id])
        
        #   위의 한 줄과 똑같다.
        #   @likes = Like.new
        #   @likes.user_id = current_user.id
        #   @likes.post_id = params[:id]
        #   @likes.save
        
        @rev = {
         :like => 1,
         :post => @post
       }
       else
         puts "3333333333"
           like.destroy
           @rs = Post.find(params[:id])
           
           @rev = {
             :like => 0,
             :post => @post
           }
       end
       puts "$44444444444@"
       
      render json: @rev
  end
end