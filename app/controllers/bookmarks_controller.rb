class BookmarksController < ApplicationController
  def bookmarks_toggle
    # puts "asdfasfasdfasdfasdfasdfasdfasd #{params[:post_id]}"
       bookmark = Bookmark.find_by(user_id: current_user.id, post_id: params[:id]) 
       
       if bookmark.nil?
           Bookmark.create(user_id: current_user.id, post_id: params[:id])
        
        #   위의 한 줄과 똑같다.
        #   @likes = Like.new
        #   @likes.user_id = current_user.id
        #   @likes.post_id = params[:id]
        #   @likes.save
       else
           bookmark.destroy
           @rs = Post.find(params[:id])
       end
       
       redirect_to :back
  end
end
