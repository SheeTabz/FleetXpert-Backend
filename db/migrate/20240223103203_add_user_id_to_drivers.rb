class AddUserIdToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_reference :drivers, :user, null: false, foreign_key: true
  end
end
