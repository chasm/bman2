class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :salt
      t.string :fish
      t.string :password_reset_code
      t.timestamp :password_reset_expires_at

      t.timestamps
    end
  end
end
