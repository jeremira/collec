class Opening < ApplicationRecord
  belongs_to :shop

  validates :start_at, presence: true
  validates :end_at,  presence: true
end

# on_monday
# where(day_id: Day.monday.id)
