# frozen_string_literal: true

class Rider < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders
end
