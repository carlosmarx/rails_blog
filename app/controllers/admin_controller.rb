class AdminController < ApplicationController
  def index; end

  def posts
    @posts = Post.all.includes(:user, :comments).order(created_at: :desc)
  end

  def comments; end

  def users; end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
