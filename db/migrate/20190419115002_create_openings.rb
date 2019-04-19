class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
