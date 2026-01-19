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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user should be valid' do
    user = User.new(email: 'testNew@ya.com', password: 'password', name: 'Name')

    assert_predicate(user, :valid?)
  end

  test 'email should be present' do
    user = User.new(email: nil, password: 'password', name: 'Name')

    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test 'email should be email' do
    user = User.new(email: 'testNew_ya.com', password: 'password', name: 'Name')

    assert_not user.valid?
    assert_includes user.errors[:email], 'is invalid'
  end
end
