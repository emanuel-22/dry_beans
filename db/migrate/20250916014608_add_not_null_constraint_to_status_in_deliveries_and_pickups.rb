class AddNotNullConstraintToStatusInDeliveriesAndPickups < ActiveRecord::Migration[8.0]
  def change
    change_column :deliveries, :status, :integer
    change_column :pickups, :status, :integer
    change_column :trips, :status, :integer
  end
end
