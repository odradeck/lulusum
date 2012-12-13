class Schedule < ActiveRecord::Base
  attr_accessible :concert_id, :end_time, :start_time
  
  belongs_to :concert
  
  def label_start_time
    self.start_time.strftime("%Y-%m-%d %H:%M")
  end
  
  def label_full
    "[" + String(self.concert.title) + "]  " + String(self.start_time.strftime("%Y-%m-%d %H:%M"))
  end
end
