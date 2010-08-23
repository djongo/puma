class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title
      t.string :publication_type
      t.string :language
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :publications
  end
end