# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @comment = PostComment.new
  end

  def create
    @comment = @post.comments.new(comment_params) do |c|
      c.creator = current_user
    end

    if @comment.save
      flash[:success] = 'New comment was successfully created'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Comment cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
