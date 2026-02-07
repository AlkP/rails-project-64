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

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category

  has_many :comments, class_name: 'PostComment', dependent: :nullify, inverse_of: :post
  has_many :likes, class_name: 'PostLike', dependent: :nullify, inverse_of: :post

  validates :title, :body, presence: true
end
