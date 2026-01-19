# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  creator_id  :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # 1. Проверка валидации присутствия полей
  test 'should not save post without title' do
    post = Post.new(body: 'Some body', creator: users(:user), category: Category.all.sample)

    assert_not post.save, 'Saved post without title'
    assert_includes post.errors[:title], 'can\'t be blank'
  end

  test 'should not save post without body' do
    post = Post.new(title: 'Some title', creator: users(:user), category: Category.all.sample)

    assert_not post.save, 'Saved post without body'
    assert_includes post.errors[:body], 'can\'t be blank'
  end

  # 2. Проверка ассоциаций
  test 'should belong to creator (User)' do
    post = Post.new(title: 'Title', body: 'Body', category: Category.all.sample)
    post.creator = users(:user)

    assert_predicate(post, :valid?, 'Post should belong to a User')
  end

  test 'should belong to category' do
    post = Post.new(title: 'Title', body: 'Body', creator: users(:user))
    post.category = Category.all.sample

    assert_predicate(post, :valid?, 'Post should belong to a Category')
  end

  # 3. Проверка успешной записи при корректных данных
  test 'should save post with valid attributes' do
    post = Post.new(
      title: 'Valid Title',
      body: 'Valid Body',
      creator: users(:user),
      category: Category.all.sample
    )

    assert post.save, 'Could not save valid post'
  end

  # 4. Проверка именования ассоциации (class_name: 'User')
  test 'creator association should use User class' do
    post = Post.create!(
      title: 'Test',
      body: 'Test body',
      creator: users(:user),
      category: Category.all.sample
    )

    assert_equal users(:user), post.creator
    assert_instance_of User, post.creator
  end

  # 5. Проверка отсутствия пост без обязательных ассоциаций
  test 'should require creator' do
    post = Post.new(title: 'Title', body: 'Body', category: Category.all.sample)

    assert_not post.valid?
    assert_includes post.errors[:creator], 'must exist'
  end

  test 'should require category' do
    post = Post.new(title: 'Title', body: 'Body', creator: users(:user))

    assert_not post.valid?
    assert_includes post.errors[:category], 'must exist'
  end
end
