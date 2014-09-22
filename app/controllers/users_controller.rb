class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @posts = Post.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
end
