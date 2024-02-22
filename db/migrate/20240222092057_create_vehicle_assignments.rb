class CreateVehicleAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_assignments do |t|
      t.date :start_date
      t.references :vehicle, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
