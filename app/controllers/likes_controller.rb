# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[destroy]

  def create
    like = PostLike.build(create_params)
    if like.valid?
      like.save
      redirect_to post_path(like.post)
    else
      redirect_to root_path
    end
  end

  def destroy
    post_like&.delete

    redirect_to post_path(@post)
  end

  def create_params
    { post_id: params[:post_id], user_id: current_user&.id }
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def post_like
    return nil unless @post

    @post.likes.where(user: current_user).find_by(id: params[:id])
  end
end
