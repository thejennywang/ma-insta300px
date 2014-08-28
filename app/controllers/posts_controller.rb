class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all	
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tag_list, :address, :price))
    @post.user = current_user
		if @post.save
      data = { id: @post.id }
      Pusher['theinstagramapp_channel'].trigger('new_upload', data)
    end
    redirect_to posts_path
	end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render partial: 'post', locals: { post: @post } }
    end
  end

end
