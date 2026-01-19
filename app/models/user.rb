# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def greeting
    "Привет, #{name? ? name : email}"
  end

  def admin?
    email.eql? 'test@ya.ru'
  end
end
