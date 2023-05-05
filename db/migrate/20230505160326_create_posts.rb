class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.rich_text :body
      t.string :view_count
      t.timestamps
    end
  end
end
