class Match < ActiveRecord::Base
  attr_accessible :concert_id, :schedule_id, :status
  
  belongs_to :concert
  has_many :tickets
end
