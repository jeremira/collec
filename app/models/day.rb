class Day < ApplicationRecord
  validates :order,
            presence: true,
            uniqueness: true,
            inclusion: { in: (0...7) }


  #
  # downcased full week day name
  #
  def full_name
    I18n.t("week_days")[order]
  end
end
