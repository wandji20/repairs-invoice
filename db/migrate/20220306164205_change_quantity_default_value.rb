class ChangeQuantityDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :invoice_items, :quantity, :integer, default: 1
  end
end
