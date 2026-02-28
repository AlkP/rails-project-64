# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @valid_comment_params = {
      content: 'Отличный пост! Спасибо за информацию.'
    }
    @invalid_comment_params = {
      content: ''
    }
  end

  test 'should create comment with valid params' do
    sign_in users(:user)

    assert_difference '::PostComment.count', +1 do
      post post_comments_path(@post), params: { post_comment: @valid_comment_params }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should not create comment with invalid params' do
    sign_in users(:user)

    assert_no_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: @invalid_comment_params }
    end

    assert { response.redirect? }
  end

  test 'should require login for creating comment' do
    post post_comments_path(@post), params: { post_comment: @valid_comment_params }

    assert { response.redirect? }
    assert_redirected_to new_user_session_url
  end
end
