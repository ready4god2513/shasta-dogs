class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :posted
      t.string :slug

      t.timestamps
    end
  end
end
