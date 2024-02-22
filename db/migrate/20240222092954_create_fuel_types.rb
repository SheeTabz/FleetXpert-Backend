class CreateFuelTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :fuel_types do |t|
      t.string :fuel_type_name

      t.timestamps
    end
  end
end
