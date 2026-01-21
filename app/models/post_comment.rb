# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  content    :string
#  parent_id  :integer
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_comments_on_post_id  (post_id)
#  index_post_comments_on_user_id  (user_id)
#

class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'PostComment', optional: true
  has_many :childs, class_name: 'PostComment',
                    foreign_key: 'parent_id',
                    dependent: :nullify,
                    inverse_of: :parent

  validates :content, presence: true

  scope :by_parent_id, ->(parent_id) { where(parent_id: parent_id) }

  def depth(count = 0)
    return count if parent.nil?

    parent.depth(count + 1)
  end
end
