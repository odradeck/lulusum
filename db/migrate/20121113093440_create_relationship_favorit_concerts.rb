class CreateRelationshipFavoritConcerts < ActiveRecord::Migration
  def change
    create_table :relationship_favorit_concerts do |t|
      t.integer :user_id
      t.integer :concert_id

      t.timestamps
    end
    
    add_index :relationship_favorit_concerts, :concert_id
   add_index :relationship_favorit_concerts, :user_id
   add_index :relationship_favorit_concerts, [:concert_id, :user_id], unique: true
  end
end
