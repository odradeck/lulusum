class Changetypescheduleofmatch < ActiveRecord::Migration
   def change
     add_column :matches, :schedule_id, :integer
     remove_column :matches, :schedule
   end 
end
