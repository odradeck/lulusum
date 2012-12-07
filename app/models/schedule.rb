class Schedule < ActiveRecord::Base
  attr_accessible :concert_id, :end_time, :start_time
  
  belongs_to :concert
end
