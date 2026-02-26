# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test 'should create like' do
    sign_in users(:user)

    assert_difference 'PostLike.count', +1 do
      post post_likes_path(@post)
    end

    assert_response :found

    like = PostLike.find_by(user: users(:user), post: @post)
    assert { like.present? && like.user == users(:user) && like.post == @post }
  end

  test 'should get destroy' do
    user = users(:user)
    sign_in user
    like = PostLike.create!(user: user, post: @post)

    assert_difference 'PostLike.count', -1 do
      delete post_like_path(@post, like)
    end

    assert_response :found

    assert { PostLike.find_by(user: user, post: @post).nil? }
  end
end
