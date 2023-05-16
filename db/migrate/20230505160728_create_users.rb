class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamp :email_confirmed_at, null: true
      t.string :remember_token, null: false
      t.datetime :last_seen_at
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :remember_token, unique: true
  end
end
