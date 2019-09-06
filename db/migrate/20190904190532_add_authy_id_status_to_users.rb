class AddAuthyIdStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authy_id, :string
    add_column :users, :authy_status, :integer, :null => false, :default => 0
  end
 end
 