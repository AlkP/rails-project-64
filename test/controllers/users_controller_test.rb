# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should not get index' do
    get users_path
    assert_response :found
  end

  test 'should not get index for user' do
    sign_in users(:user)
    get users_path

    assert_response :success
    assert_not response.body.include?('test@ya.ru')
  end

  test 'should get index for admin' do
    sign_in users(:admin)
    get users_path

    assert_response :success
    assert response.body.include?('test@ya.ru')
    assert response.body.include?('testN@ya.ru')
  end

  test 'should not get show' do
    get user_path(users(:user).id)

    assert_response :found
    assert_redirected_to new_user_session_path
  end

  test 'should get show' do
    sign_in users(:admin)
    get user_path(users(:user).id)

    assert_response :success
    assert response.body.include?('Профиль')
  end
end
