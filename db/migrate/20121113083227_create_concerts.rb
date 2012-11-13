class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.string :poster
      t.string :reflink
      t.string :description
      t.string :status
      t.string :category
      t.integer :score
      t.string :breakday
      t.string :location
      t.string :location_url
      t.integer :price
      t.integer :available

      t.timestamps
    end
  end
end
