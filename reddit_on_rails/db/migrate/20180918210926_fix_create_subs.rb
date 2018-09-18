class FixCreateSubs < ActiveRecord::Migration[5.2]
  def change
    change_column :postsubs, :post_id, :integer, null:false
    change_column :postsubs, :sub_id, :integer, null:false
    add_index :postsubs, :post_id
    add_index :postsubs, :sub_id
  end

end
