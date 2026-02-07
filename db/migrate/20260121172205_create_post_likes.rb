# frozen_string_literal: true

class CreatePostLikes < ActiveRecord::Migration[8.1]
  def change
    create_table :post_likes do |t|
      t.references :post
      t.references :user

      t.timestamps
    end

    add_index :post_likes, %i[post_id user_id], unique: true
  end
end
