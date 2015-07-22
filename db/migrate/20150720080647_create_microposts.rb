class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :product, index: true, foreign_key: true
      
      t.timestamps null: false
    end
    add_index :microposts, [:product_id, :created_at]
  end
end
