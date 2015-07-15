class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |table|
      table.string :name
      table.text :url
      table.decimal :price, precision: 10, scale: 8
      table.timestamps null: false
    end
  end
end
