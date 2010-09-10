Company.find_or_create_by_name(
  :name                   => 'Smith & Hammaker'
)

User.create(
  :first_name             => 'Admin',  
  :last_name              => 'User',   
  :username               => 'admin',  
  :password               => 'notthis',
  :password_confirmation  => 'notthis',
  :role                   => 'admin',
  :company_id             => '1',
  :email                  => 'admin@example.com'
)

["Laptop", "Desktop", "Server", "Printer", "Switch", "Firewall", "Router", "ISP Equipment", "Other"].each do |c|  
  Classification.find_or_create_by_name c  
end