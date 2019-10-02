class CreateUsrs < ActiveRecord::Migration[5.2]
  def change
    create_table :usrs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :confirm_password
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
