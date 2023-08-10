# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_secure_password
  has_many :reviews, dependent: :destroy
  # validates :username, uniqueness: { case_sensitive: false }
end
