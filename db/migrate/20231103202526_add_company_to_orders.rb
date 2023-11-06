class AddCompanyToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :company, :string
  end
end
