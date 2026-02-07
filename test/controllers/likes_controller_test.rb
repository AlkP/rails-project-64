# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test 'should get create' do
    sign_in users(:user)
    post post_likes_path(post_id: @post.id)

    assert_response :found
  end

  test 'should get destroy' do
    sign_in users(:admin)
    delete post_like_path(@post)

    assert_response :found
  end
end
