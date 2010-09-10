class Asset < ActiveRecord::Base
  belongs_to :classification
  belongs_to :company
  
  attr_accessible :company_id, :name, :description, :os, :location, :classification_id, :peripherals, :anti_virus, :software, :firmware, :serial_number, :part_number, :service_tag, :warranty, :ip, :user_name, :user_password

  validates :company, :name, :description, :classification, :location, :presence => true
end
