class ParentOnPostComments < ActiveRecord::Migration[8.1]
  def change
    add_column :post_comments, :parent_id, :integer
  end
end
