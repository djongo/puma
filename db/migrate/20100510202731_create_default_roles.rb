class CreateDefaultRoles < ActiveRecord::Migration
  def self.up
    r1 = Role.create(:name=>'author',:show_name=>'Author')
    r1.save
    
    r2 = Role.create(:name=>'publication_group',:show_name=>'Publication Group')
    r2.save
    
    r3 = Role.create(:name=>'hbsc_member',:show_name=>'HSBC Member')
  end

  def self.down
    execute "TRUNCATE TABLE roles"
    execute "TRUNCATE TABLE assignments"  
  end
end
