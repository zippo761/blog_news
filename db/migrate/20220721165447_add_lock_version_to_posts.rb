class AddLockVersionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :lock_version, :integer
  end
end
