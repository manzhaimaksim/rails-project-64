class PostsController < ApplicationController
  before_action :set_current_user, except: [:show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'New post was successfully created'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def set_current_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
