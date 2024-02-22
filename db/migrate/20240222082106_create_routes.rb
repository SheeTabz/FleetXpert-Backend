class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :to
      t.string :from

      t.timestamps
    end
  end
end
