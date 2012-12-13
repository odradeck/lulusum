class Match < ActiveRecord::Base
  attr_accessible :concert_id, :schedule_id, :status
  
  belongs_to :concert
  belongs_to :schedule
  has_many :tickets
end
