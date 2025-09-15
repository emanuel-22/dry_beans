class CreateTrips < ActiveRecord::Migration[8.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true
      t.string :driver_name
      t.string :vehicle_plate
      t.datetime :started_at
      t.datetime :ended_at
      t.string :status

      t.timestamps
    end
  end
end
