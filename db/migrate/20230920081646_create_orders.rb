class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :table
      t.string :content
      t.integer :number

      t.timestamps
    end
  end
end
