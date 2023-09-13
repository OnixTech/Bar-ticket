class DropUnwantedTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :items
    drop_table :menus  
  end
end
