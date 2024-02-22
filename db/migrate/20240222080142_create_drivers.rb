class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :email
      t.string :mobile
      t.integer :national_id
      t.string :license_no
      t.string :license_type
      t.date :license_issue_date
      t.date :date_of_birth
      t.text :address
      t.date :joining_date

      t.timestamps
    end
  end
end
