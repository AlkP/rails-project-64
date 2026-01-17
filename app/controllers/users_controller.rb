# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, except: %i[new create]
  before_action :find_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.create(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  end

  def update; end
  # def destroy; end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
