class CreatePostComments < ActiveRecord::Migration[8.1]
  def change
    create_table :post_comments do |t|
      t.string :content

      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end
  end
end
