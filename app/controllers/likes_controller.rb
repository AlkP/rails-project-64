# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[destroy]

  def create
    like = PostLike.build(create_params)
    like.save if like.valid?

    redirect_to post_path(like.post)
  end

  def destroy
    PostLike.where(create_params)&.delete_all

    redirect_to post_path(@post)
  end

  def create_params
    { post_id: params[:post_id], user_id: current_user.id }
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
