class Day < ApplicationRecord
  validates :order,
            presence: true,
            uniqueness: true,
            inclusion: { in: (0...7) }
end
