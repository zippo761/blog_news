class AddCountUpdatePostToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :count_update, :integer, default: 0
  end
end
