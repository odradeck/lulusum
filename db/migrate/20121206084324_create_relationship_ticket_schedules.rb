class CreateRelationshipTicketSchedules < ActiveRecord::Migration
  def change
    create_table :relationship_ticket_schedules do |t|
      t.integer :ticket_id
      t.integer :schedule_id

      t.timestamps
    end
    
   add_index :relationship_ticket_schedules, :ticket_id
   add_index :relationship_ticket_schedules, :schedule_id
   add_index :relationship_ticket_schedules, [:ticket_id, :schedule_id], unique: true
  end
end
