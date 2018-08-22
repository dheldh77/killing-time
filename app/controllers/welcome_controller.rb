class WelcomeController < ApplicationController
  require 'mechanize'
  
  def index
    # @posts = Post.joins("LEFT OUTER JOIN Likes ON likes.post_id = posts.id 
    #                 AND likes.created_at >= DATETIME('now', '-1 day')")
    #                 .group("posts.id").order("COUNT(likes.id) DESC")
    @posts = Post.all
  end
  
  def user_data

    agent = Mechanize.new
    begin 
      @rs = RealStory.new
      page2 = agent.get("http://ghostism.co.kr/horrorstory/1354364")
      page2.search("#bd > div.rd.rd_nav_style2.clear > div.rd_hd.clear > div.board.clear > div.top_area.ngeb > h1 > a").map(&:text).each do |t|
        @rs.title = t
      end
      page2.search("#bd > div.rd.rd_nav_style2.clear > div.rd_body.clear > div").map(&:text).each do |c|
        @rs.content = c
      end
      @rs.user_id = 1
      @rs.save
      rescue Mechanize::ResponseCodeError => e
      end
    # end
    redirect_to "/real_story/index"
  end
    # page = agent.get("https://uni.likelion.org")
    
    # my_page = page.form_with(:action => "/users/sign_in") do |f|
    #     f.field_with(:name => "user[email]").value = "bluegisa@likelion.org"
    #     f.field_with(:name => "user[password]").value = "tksgk930"
    # end.submit
    
  # 1354364.downto(5050).each do |x|
  #   begin
  #     @rs = RealStory.new
  #     page2 = agent.get("https://http://ghostism.co.kr/horrorstory/#{x}")
  #     page2.search("#bd > div.rd.rd_nav_style2.clear > div.rd_hd.clear > div.board.clear > div.top_area.ngeb > h1").map(&:text).each do |t|
  #       @rs.title = t
  #     end
  #     page2.search("#bd > div.rd.rd_nav_style2.clear > div.rd_body.clear > div").map(&:text).each do |c|
  #       @rs.content = c
  #     end
  #     @rs.save
  #     rescue Mechanize::ResponseCodeError => e
  #     end
  #   end
  #   redirect_to "welcome/index"
  #   # puts name + email + subtitle + content
  # end
end