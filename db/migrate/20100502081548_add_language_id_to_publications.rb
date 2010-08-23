class AddLanguageIdToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :language_id, :integer
  end

  def self.down
    remove_column :publications, :language_id
  end
end
