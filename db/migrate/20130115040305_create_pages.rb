class CreatePages < ActiveRecord::Migration
  
  def change
    create_table :pages do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.text :sidebar
      t.integer :parent_id
      t.boolean :posted
      t.string :slug

      t.timestamps
    end
  end
  
end