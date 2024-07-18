# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = 'New post was successfully created'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
