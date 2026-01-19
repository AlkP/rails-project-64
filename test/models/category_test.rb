# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  name       :string
#  updated_at :datetime         not null
#

# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'valid category' do
    category = categories(:movie)

    assert_predicate category, :valid?
  end
end
