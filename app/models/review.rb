class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rider, optional: true
  belongs_to :product, optional: true
end
