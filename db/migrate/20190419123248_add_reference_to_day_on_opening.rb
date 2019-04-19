class AddReferenceToDayOnOpening < ActiveRecord::Migration[5.1]
  def change
    add_reference :openings, :day, index: true
  end
end
