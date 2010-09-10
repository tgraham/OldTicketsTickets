class Company < ActiveRecord::Base
  has_many :users
  has_many :assets
  
  attr_accessible :name, :notes
  
  validates :name, :presence => true
end
