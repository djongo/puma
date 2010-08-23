# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
require "declarative_authorization/maintenance" 
Authorization::Maintenance::without_access_control do

  puts "Seeding database with master data"

  PublicationType.create(:id => 1, :name => "Journal article")
  PublicationType.create(:id => 2, :name => "Book")
  PublicationType.create(:id => 3, :name => "Book chapter")

  Survey.create(:id => 1, :name => "83/84")
  Survey.create(:id => 2, :name => "85/86")
  Survey.create(:id => 3, :name => "89/90")
  Survey.create(:id => 4, :name => "93/94")
  Survey.create(:id => 5, :name => "97/98")
  Survey.create(:id => 6, :name => "01/02")
  Survey.create(:id => 7, :name => "05/06")
  Survey.create(:id => 8, :name => "09/10")

  puts "Seeding roles"

  Role.create(:id => 1, :name=>'author',:show_name=>'Author')
  Role.create(:id => 2, :name=>'publication_group',:show_name=>'Publication Group')
  Role.create(:id => 3, :name=>'hbsc_member',:show_name=>'HSBC Member')

end
