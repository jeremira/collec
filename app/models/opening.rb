class Opening < ApplicationRecord
  belongs_to :shop
  belongs_to :day

  validates :start_at, presence: true
  validates :end_at,  presence: true

  #
  # Identify an opening week day
  # Opening instance will answer to  #on_monday, #on_tuesday... like method
  #
  Date::DAYS_INTO_WEEK.each do |week_day, day_order|
    define_method "on_#{week_day}" do
      day.order == day_order
    end
  end
end
