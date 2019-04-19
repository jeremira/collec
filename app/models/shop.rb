class Shop < ApplicationRecord
  has_many :openings, dependent: :destroy
end
