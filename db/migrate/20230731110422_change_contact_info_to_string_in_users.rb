class ChangeContactInfoToStringInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :contact_info, :string
  end
end
