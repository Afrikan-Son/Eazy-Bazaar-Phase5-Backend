class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :contact_info, :bigint
  end
end
