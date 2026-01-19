# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  name       :string
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
end
