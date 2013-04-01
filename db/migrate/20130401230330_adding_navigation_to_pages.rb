class AddingNavigationToPages < ActiveRecord::Migration
  
  def change
    add_column :pages, :show_in_navigation, :boolean, default: false
    add_index :pages, :show_in_navigation
  end
  
end
