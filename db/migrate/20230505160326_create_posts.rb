class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :view_count
      t.datetime :published_at
      t.timestamps
    end
  end
end
