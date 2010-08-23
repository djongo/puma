class RemovePublicationTypeFromPublications < ActiveRecord::Migration
  def self.up
    remove_column :publications, :publication_type
  end

  def self.down
    add_column :publications, :publication_type, :string
  end
end
