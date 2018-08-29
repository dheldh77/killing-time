class BookmarksController < ApplicationController
  def bookmarks_toggle
    # puts "asdfasfasdfasdfasdfasdfasdfasd #{params[:post_id]}"
       bookmark = Bookmark.find_by(user_id: current_user.id, post_id: params[:id])
       @post = Post.find(params[:id])
       
       if bookmark.nil?
           Bookmark.create(user_id: current_user.id, post_id: params[:id])
        
           @rev = {
             :bookmark => 1,
             :post => @post,
             :image => @post.image,
             :id => @post.id,
             :title => @post.title
           }
       else
           bookmark.destroy
           @rs = Post.find(params[:id])
           
           @rev = {
             :bookmark => 0,
             :post => @post,
             :image => @post.image,
             :id => @post.id,
             :title => @post.title
           }
       end
       
      # redirect_to :back
      render json: @rev
  end
end
