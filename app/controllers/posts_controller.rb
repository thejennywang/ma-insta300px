class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all	
    @posts = Post.order(created_at: :desc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tag_list, :address, :price))
    @post.user = current_user
		if @post.save
      post_data = { 
        id: @post.id, 
        title: @post.title, 
        charge_url: "/posts/#{@post.id}/charge", 
        picture_url: @post.picture.url(:medium), 
        address: @post.address, 
        map_url: "/posts/#{@post.id}/map", 
        tag_list: @post.tags.map { |tag| {text: tag.text, url: "/tags/#{tag.text.delete('#')}"} }, 
        like_count: @post.likes.count 
      }
      Pusher['theinstagramapp_channel'].trigger('new_upload', post_data)
    else
      flash[:error] 
      redirect_to '/'
    end
	end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render partial: 'post', locals: { post: @post } }
    end
  end

end
