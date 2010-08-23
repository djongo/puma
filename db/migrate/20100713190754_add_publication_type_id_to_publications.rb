class AddPublicationTypeIdToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :publication_type_id, :integer
  end

  def self.down
    remove_column :publications, :publication_type_id
  end
end
