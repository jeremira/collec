class Day < ApplicationRecord
  has_many :openings
  
  validates :order,
            presence: true,
            uniqueness: true,
            inclusion: { in: (0...7) }

  #
  # Scopes
  #
  scope :monday,    ->() { find_or_create_by order: 0 }
  scope :tuesday,   ->() { find_or_create_by order: 1 }
  scope :wednesday, ->() { find_or_create_by order: 2 }
  scope :thursday,  ->() { find_or_create_by order: 3 }
  scope :friday,    ->() { find_or_create_by order: 4 }
  scope :saturday,  ->() { find_or_create_by order: 5 }
  scope :sunday,    ->() { find_or_create_by order: 6 }

  #
  # downcased full week day name
  #
  def full_name
    I18n.t("week_days")[order]
  end
end
