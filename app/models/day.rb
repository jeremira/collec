class Day < ApplicationRecord
  has_many :openings

  validates :order,
            presence: true,
            uniqueness: true,
            inclusion: { in: (0...7) }

  #
  # List of week day names starting from sunday by default
  # Pass Time#wday index for from params (sunday is 0)
  #
  def self.week_day_names(from: 0)
    Date::DAYNAMES.map(&:downcase).rotate(from)
  end
end
