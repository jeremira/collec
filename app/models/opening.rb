class Opening < ApplicationRecord
  belongs_to :shop
  belongs_to :day

  validates :start_at, presence: true
  validates :end_at,  presence: true

  #
  # Human readable opening slot time
  #
  def display_opening_time
    start_at.strftime("%H:%M") + "-" + end_at.strftime("%H:%M")
  end

  #
  # Identify an opening week day
  # Opening instance will answer to  #on_monday, #on_tuesday... like method
  # ie : monday_opening.on_saturday => false
  #
  Day.week_day_names.each_with_index do |week_day, day_order|
    define_method "on_#{week_day}" do
      day.order == day_order
    end
  end
end
