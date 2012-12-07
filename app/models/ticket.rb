class Ticket < ActiveRecord::Base
  attr_accessible :concert_id, :filter_age, :filter_job, :filter_keyword, :filter_tribe, :filter_type_1, :filter_type_2, :filter_type_3, :match_id, :user_id
  attr_accessible :relationship_ticket_schedules_attributes
  
  belongs_to :user
  belongs_to :concert
  belongs_to :match

  has_many :relationship_ticket_schedules, :dependent => :destroy
  has_many :select_schedules, :through=> :relationship_ticket_schedules, :source => :schedule
  
  accepts_nested_attributes_for :relationship_ticket_schedules, allow_destroy: true
end
