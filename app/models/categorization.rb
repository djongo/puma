class Categorization < ActiveRecord::Base
  attr_accessible :publication_id, :keyword_id
  belongs_to :publication
  belongs_to :keyword
end
