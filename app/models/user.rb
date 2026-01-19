# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  name                 :string
#  encrypted_password   :string
#  reset_password_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_email                  (email)
#  index_users_on_reset_password_token   (reset_password_token)

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
