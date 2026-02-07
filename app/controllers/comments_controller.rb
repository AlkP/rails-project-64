# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = PostComment.build(create_params)

    if @comment.valid?
      @comment.save
      redirect_to post_path(@comment.post), notice: t('.create.notice')
    elsif @comment.post
      @post = @comment.post
      redirect_to post_path(@comment.post), alert: t('.create.alert')
    else
      redirect_to root_path, alert: t('.create.warning')
    end
  end

  private

  def create_params
    permitted_params.merge(post_id: params[:post_id]).merge(user_id: current_user&.id)
  end

  def permitted_params
    params.expect(post_comment: [:content])
  end
end
