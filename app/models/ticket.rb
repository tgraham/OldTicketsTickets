class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :replies, :dependent => :destroy
  
  has_attached_file :screenshot, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/screenshots/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/screenshots/:id/:style/:basename.:extension"
  
  attr_accessible :title, :content, :user_id, :priority, :status, :screenshot
  
  validates :title, :content, :priority, :presence => true
  
  STATUS = %w[Open Answered Customer-Reply On-hold Closed]
  
  PRIORITY = %w[Low Medium High]
end
