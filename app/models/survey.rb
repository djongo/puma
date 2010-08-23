class Survey < ActiveRecord::Base
  using_access_control
  attr_accessible :name, :publication_ids
  has_many :foundations
  has_many :publications, :through => :foundations  
  validates_presence_of :name
end
