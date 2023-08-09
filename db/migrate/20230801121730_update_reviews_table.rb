# frozen_string_literal: true

class UpdateReviewsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :rider_id, :bigint, null: true
    change_column :reviews, :product_id, :bigint, null: true
  end
end
