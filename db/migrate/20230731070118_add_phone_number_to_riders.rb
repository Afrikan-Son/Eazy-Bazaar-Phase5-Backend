class AddPhoneNumberToRiders < ActiveRecord::Migration[7.0]
  def change
    add_column :riders, :phone_number, :bigint
  end
end
