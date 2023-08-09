# frozen_string_literal: true

class AddColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :instock, :boolean
    add_column :products, :stock_count, :integer
  end
end
