class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :priority
      t.string :status
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tickets
  end
end
