class MapsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def show
    @post = Post.find(params[:post_id])
  end
end
