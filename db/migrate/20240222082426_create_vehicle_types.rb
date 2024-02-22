class CreateVehicleTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_types do |t|
      t.string :vehicle_type_name

      t.timestamps
    end
  end
end
