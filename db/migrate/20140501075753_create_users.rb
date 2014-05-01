class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.date :born_on

      t.timestamps
    end
  end
end
