# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  parent_id  :integer
#  post_id    :integer          not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  ancestry   :string
#
# Indexes
#
#  index_post_comments_on_ancestry  (ancestry)
#  index_post_comments_on_post_id   (post_id)
#  index_post_comments_on_user_id   (user_id)
#

require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
