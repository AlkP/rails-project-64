class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
