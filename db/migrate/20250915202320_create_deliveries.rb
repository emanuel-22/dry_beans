class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :status
      t.datetime :scheduled_at
      t.datetime :completed_at
      t.string :recipient_name
      t.string :recipient_document
      t.string :photo_url
      t.float :latitude
      t.float :longitude
      t.text :notes
      t.integer :attempts_number

      t.timestamps
    end
  end
end
