class AddIndexOnDayOrder < ActiveRecord::Migration[5.1]
  def change
    add_index :days, :order, unique: true
  end
end
