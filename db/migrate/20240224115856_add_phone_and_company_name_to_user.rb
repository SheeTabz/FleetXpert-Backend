class AddPhoneAndCompanyNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :company_name, :string
    add_column :users, :username, :string
  end
end
