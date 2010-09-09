class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer :ticket_id
      t.text :notes
      t.string :screenshot_file_name
      t.string :screenshot_content_type
      t.integer :screenshot_file_size
      t.datetime :screenshot_updated_at
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :replies
  end
end
