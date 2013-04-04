class AddingOptionToHideSidebar < ActiveRecord::Migration
  
	def change
		add_column :pages, :full_page_width, :boolean, default: false
	end

end
