class FocusGroup < ActiveRecord::Base
  using_access_control
  attr_accessible :name
  validates_presence_of :name
end
