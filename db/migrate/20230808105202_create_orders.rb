class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :rider
      t.string :references
      t.float :total_amount
      t.date :date

      t.timestamps
    end
  end
end
