class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :concert_id
      t.string :status
      t.string :schedule

      t.timestamps
    end
  end
end
