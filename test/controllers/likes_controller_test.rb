# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test 'should get create' do
    sign_in users(:user)
    post post_post_likes_path(@post)

    assert_response :found
  end

  test 'should get destroy' do
    sign_in users(:user)
    delete post_post_likes_path(@post)

    assert_response :found
  end
end
