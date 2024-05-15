class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # restaurant.reviews ----> returns an array of reviews connected to that specific restaurant
end
