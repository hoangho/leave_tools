class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.float :balance
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
