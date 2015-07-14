class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |table|
      table.string :name
      table.text :url
      table.decimal :price
      table.timestamps null: false
    end
  end
end
