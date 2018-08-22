class RealStoryController < ApplicationController
  
  before_action :authenticate_user!, except: [:search]
  # before_action :log_impression, :only=> [:show]
  
  def index
    @token = form_authenticity_token
    @posts = Post.where(category: 1).reverse
    
    # @latest_post = []
    
    # (0..4).each do |i|
    #   @latest_post[i] = @posts[i]
    # end
    
    @rs = Post.all
    @bm = Bookmark.where(user_id: current_user.id)
    @bookmarks = []
    @rs.each do |r|
      @bm.each do |b|
        if r.id == b.post_id
          @bookmarks.push(r)
        end
      end
    end
  end

  def new
    @token = form_authenticity_token
  end

  def create
    
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    # 글쓸 때 유저네임을 저장한다.
    @post.category = 1
    @post.user_id = current_user.id
    
    if params[:image].nil?
      @post.save
    else
      params[:image].each do |i|
        uploader = ImageUploader.new  
        uploader.store!(i)
        @post.image.push(uploader.url)
        @post.thumb = uploader.thumb.url
        @post.middle = uploader.middle.url
      end
    end
    
    # new.html의 input에 name이 image임 그거랑 맞춰준다.
    @post.save
    # redirect_to 뒤에는 쌍따옴표로 두자
    #밑에 주소 이동을 주석처리하고 실행시키면, create.html파일이 뜨는데, 주소를 보면 params값이 날라오는 것을 볼 수 있음.
    redirect_to  "/real_story/post/my_post"
  end

  def update
    @token = form_authenticity_token
    @post = Post.find(params[:id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    
   if params[:image].nil?
      @post.save
    else
      params[:image].each do |i|
        uploader = ImageUploader.new  
        uploader.store!(i)
        @post.image.push(uploader.url)
        @post.thumb = uploader.thumb.url
        @post.middle = uploader.middle.url
      end
    end
    @post.save
    
    redirect_to  "/real_story/post/my_post"
    # redirect_to  "/post/show/" + params[:id]로 해도 된다.
  end

  def edit
    @token = form_authenticity_token
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    
    # user_id가 1번이면 다 통과할 수 있도록 하면 administrator가 된다.
    # 글 작성자만 지울 수 글을 지울 수 있도록 만든다.
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to "/real_story/post/my_post"
    else
      redirect_to "/real_story"
    end
  end

  def show
    @token = form_authenticity_token
    @post = Post.find(params[:id])
    
    @rs = Post.all
    @bm = Bookmark.where(user_id: current_user.id)
    @bookmarks = []
    @rs.each do |r|
      @bm.each do |b|
        if r.id == b.post_id
          @bookmarks.push(r)
        end
      end
    end
  end
 
  # def log_impression
  #   @hit_post = Post.find(params[:id])
  #   # this assumes you have a current_user method in your authentication system
  #   @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  # end

  def search
    # Post.where(:title => "asdasd") #완전히 똑같은 것만 검색함
    category = params[:category]
    if category == "title"
      @posts = Post.where("title LIKE ?", "%#{params[:q]}%") #title은 column명
    elsif category == "content"
      @posts = Post.where("content LIKE ?", "%#{params[:q]}%")
    elsif category == "titleContent"
      @posts = Post.where("title LIKE ? OR content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    elsif category == "user"
      @posts = Post.where("username LIKE ?", "%#{params[:q]}%").take.posts
    end
    
    @rs = Post.all
    @bm = Bookmark.where(user_id: current_user.id)
    @bookmarks = []
    @rs.each do |r|
      @bm.each do |b|
        if r.id == b.post_id
          @bookmarks.push(r)
        end
      end
    end
  end
  
  # def bookmark_search
  #   @post = Post.find(params[:id])
    
  #   @rs = Post.all
  #   @bm = Bookmark.where(user_id: current_user.id)
  #   @bookmarks = []
  #   @rs.each do |r|
  #     @bm.each do |b|
  #       if r.id == b.post_id
  #         @bookmarks.push(r)
  #       end
  #     end
  #   end
  # end
  
  def my_post
    @token = form_authenticity_token
    @posts = Post.where(user_id: current_user.id).reverse
    @rs = Post.all
    @bm = Bookmark.where(user_id: current_user.id)
    @bookmarks = []
    @rs.each do |r|
      @bm.each do |b|
        if r.id == b.post_id
          @bookmarks.push(r)
        end
      end
    end
  end
  
end
