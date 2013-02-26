class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :avatar
      t.string :headline
      t.text :information

      t.timestamps
    end
  end
end
