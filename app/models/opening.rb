class Opening < ApplicationRecord
  belongs_to :shop
  belongs_to :day

  validates :start_at, presence: true
  validates :end_at,  presence: true

  #
  # Human readable opening slot time
  #
  def display_opening_time
    "slottime"
  end

  #
  # Identify an opening week day
  # Opening instance will answer to  #on_monday, #on_tuesday... like method
  #
  Day.week_days.each do |week_day, day_order|
    define_method "on_#{week_day}" do
      day.order == day_order
    end
  end
end
