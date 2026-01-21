# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  content    :string
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

  validates :content, presence: true
end
