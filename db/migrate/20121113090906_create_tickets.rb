class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :concert_id
      t.string :filter_type_1
      t.string :filter_type_2
      t.string :filter_type_3
      t.string :filter_age
      t.string :filter_job
      t.string :filter_tribe
      t.string :filter_keyword

      t.timestamps
    end
  end
end
