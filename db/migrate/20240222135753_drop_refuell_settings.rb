class DropRefuellSettings < ActiveRecord::Migration[7.0]
  def change
    drop_table :refuelling_settings
  end
end
