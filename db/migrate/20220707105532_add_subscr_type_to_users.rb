class AddSubscrTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscription_type, :integer
  end
end
