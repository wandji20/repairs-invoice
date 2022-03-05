class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.string :name
      t.float :price
      t.integer :total

      t.timestamps
    end
    add_index :parts, :name
  end
end
