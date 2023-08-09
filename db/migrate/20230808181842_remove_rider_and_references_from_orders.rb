# frozen_string_literal: true

class RemoveRiderAndReferencesFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :rider, :string
    remove_column :orders, :references, :string
    add_reference :orders, :rider, foreign_key: { to_table: :riders }, index: true, null: true
  end
end
