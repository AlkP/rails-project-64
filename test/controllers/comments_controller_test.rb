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

    assert_difference('::PostComment.count') do
      post post_post_comments_path(@post), params: { post_comment: @valid_comment_params }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should create comment with valid params #2' do
    sign_in users(:user)

    post post_post_comments_path(@post), params: { post_comment: @valid_comment_params }
    comment = PostComment.last

    assert_equal @valid_comment_params[:content], PostComment.last.content
    assert_equal @post.id, comment.post_id
  end

  test 'should not create comment with invalid params' do
    sign_in users(:user)

    assert_no_difference('PostComment.count') do
      post post_post_comments_path(@post), params: { post_comment: @invalid_comment_params }
    end

    assert_response :unprocessable_content
    # assert_template :show
    # assert_select 'div.alert', "Content can't be blank"
  end

  test 'should require login for creating comment' do
    post post_post_comments_path(@post), params: { post_comment: @valid_comment_params }

    assert_response :redirect
    assert_redirected_to new_user_session_url
  end
end
