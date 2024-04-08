class CreateTokenBlacklists < ActiveRecord::Migration[7.0]
  def change
    create_table :token_blacklists do |t|
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
