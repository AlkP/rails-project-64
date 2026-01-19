# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user should be valid' do
    user = User.new(email: 'testNew@ya.com', password: 'password', name: 'Name')

    assert user.valid?
  end

  test 'email should be present' do
    user = User.new(email: nil, password: 'password', name: 'Name')

    refute user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test 'email should be email' do
    user = User.new(email: 'testNew_ya.com', password: 'password', name: 'Name')

    refute user.valid?
    assert_includes user.errors[:email], 'is invalid'
  end
end
