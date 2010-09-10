class Classification < ActiveRecord::Base
  has_many :assets
  attr_accessible :name
  
  validates :name, :presence => true
end
