class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :country
      t.date :date_of_birth
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
