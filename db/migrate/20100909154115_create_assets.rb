class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :name
      t.text :description
      t.string :os
      t.string :location
      t.integer :classification_id
      t.text :peripherals
      t.boolean :anti_virus
      t.text :software
      t.string :firmware
      t.string :serial_number
      t.string :part_number
      t.string :service_tag
      t.datetime :warranty
      t.string :ip
      t.string :user_name
      t.string :user_password
      t.timestamps
    end
  end
  
  def self.down
    drop_table :assets
  end
end
