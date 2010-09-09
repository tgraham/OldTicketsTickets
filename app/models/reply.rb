class Reply < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  
  has_attached_file :screenshot, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/reply/screenshots/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/reply/screenshots/:id/:style/:basename.:extension"
                    
  attr_accessible :ticket_id, :notes, :screenshot
  
  validates :notes, :presence => true
  
  after_create :update_ticket
  
  private
    def ticket_status
      user.is_admin? ? 'Answered' : 'Customer-Reply'
    end
    
    def update_ticket
      ticket.update_attributes(:status => ticket_status)
    end
end
