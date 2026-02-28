# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.build(create_params)

    if @post.valid?
      @post.save
      redirect_to @post, notice: t('.create.notice')
    else
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post&.destroy

    redirect_to root_path, notice: t('.destroy.notice')
  end

  private

  def create_params
    permitted_params.merge(creator_id: current_user&.id)
  end

  def permitted_params
    params.expect(post: %i[title body category_id])
  end
end
