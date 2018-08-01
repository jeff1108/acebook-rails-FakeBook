class PostsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @post = Post.create(post_params)
    redirect_to user_path(@user)
  end

  private

  def post_params
    { user_id: params[:user_id], message: params[:message] }
  end

end
