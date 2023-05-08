class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      # t.references :user, foreign_key: true
      t.text :body, null: false
      t.boolean :approved, default: false
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
