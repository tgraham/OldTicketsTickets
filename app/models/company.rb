class Company < ActiveRecord::Base
  has_many :users
  
  attr_accessible :name, :notes
  
  validates :name, :presence => true
end
