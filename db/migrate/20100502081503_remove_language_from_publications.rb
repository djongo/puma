class RemoveLanguageFromPublications < ActiveRecord::Migration
  def self.up
    remove_column :publications, :language
  end

  def self.down
    add_column :publications, :language, :string
  end
end
