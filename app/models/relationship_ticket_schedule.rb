class RelationshipTicketSchedule < ActiveRecord::Base
  attr_accessible :schedule_id, :ticket_id
  
  belongs_to :schedule
  belongs_to :ticket
  
  validates_uniqueness_of :schedule_id, :scope => [:ticket_id]
end
