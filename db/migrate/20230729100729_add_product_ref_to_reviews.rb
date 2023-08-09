# frozen_string_literal: true

class AddProductRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :product, null: false, foreign_key: true
  end
end
