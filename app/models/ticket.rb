class Ticket < ActiveRecord::Base
  attr_accessible :concert_id, :filter_age, :filter_job, :filter_keyword, :filter_tribe, :filter_type_1, :filter_type_2, :filter_type_3, :match_id, :user_id
  
  belongs_to :user
  belongs_to :concert
  belongs_to :match

  
end
