class AddUserLastUpdateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_last_update, :string
  end
end
