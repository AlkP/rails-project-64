# frozen_string_literal: true

# == Schema Information
#
# Table name: post_likes
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_likes_on_post_id              (post_id)
#  index_post_likes_on_post_id_and_user_id  (post_id,user_id) UNIQUE
#  index_post_likes_on_user_id              (user_id)
#

require 'test_helper'

class PostLikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
