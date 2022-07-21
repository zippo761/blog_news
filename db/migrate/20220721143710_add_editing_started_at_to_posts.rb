class AddEditingStartedAtToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :editing_started_at, :timestamp
  end
end
