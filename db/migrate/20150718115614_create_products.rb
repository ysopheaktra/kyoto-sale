class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.boolean :sold, default: false  
      t.string :picture

      t.timestamps null: false
    end
    add_index :products, [:id, :created_at]
  end
end
