class AddCompanyIdToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :company_id,    :integer
  end

  def self.down
    remove_column :assets, :company_id
  end
end
