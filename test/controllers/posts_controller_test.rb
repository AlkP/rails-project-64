# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index' do
    get posts_path

    assert_response :success
  end

  test 'should get show' do
    get post_path(Post.first)

    assert_response :success
  end

  test 'should get new for nobody' do
    get new_post_path

    assert_response :found
  end

  test 'should get new for user' do
    sign_in users(:user)
    get new_post_path

    assert_response :success
  end
end
