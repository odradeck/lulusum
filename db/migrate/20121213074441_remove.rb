class Remove < ActiveRecord::Migration
  def change
   remove_index :relationship_ticket_schedules, :column=>[:ticket_id, :schedule_id]
   add_index :relationship_ticket_schedules, [:ticket_id, :schedule_id]
  end
end
