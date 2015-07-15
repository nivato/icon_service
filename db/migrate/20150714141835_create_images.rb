class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |table|
      table.string :name
      table.text :url
      table.text :origin_url
      table.string :content_type
      table.decimal :origin_kb, precision: 15, scale: 8
      table.decimal :price, precision: 10, scale: 8
      table.timestamps null: false
    end
  end
end
