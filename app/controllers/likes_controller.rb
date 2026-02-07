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
    PostLike.find_by(id: like_id)&.delete

    redirect_to post_path(@post)
  end

  def create_params
    { post_id: params[:post_id], user_id: current_user.id }
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end

  def like_id
    return nil unless @post
    return nil unless (like = @post.likes.find_by(user: current_user))

    like.id
  end
end
