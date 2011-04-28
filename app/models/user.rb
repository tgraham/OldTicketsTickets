class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :tickets
  has_many :replies
  belongs_to :company
  
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :role, :company_id
  
  validates :first_name, :last_name, :username, :email, :presence => true
  
  ROLES = %w[user admin]
  
  def name
    self.first_name + ' ' + self.last_name
  end
  
  def deliver_reset_email!
    reset_perishable_token!
    Notifier.reset_email(self).deliver
  end
  
  def is_admin?
    role && role == 'admin'
  end
  
  def is_user?
    role && role == 'user'
  end
end
