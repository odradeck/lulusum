class InterestUser < ActiveRecord::Base
  attr_accessible :t_user_id, :user_id
  
  belongs_to :user
  belongs_to :t_user, :class_name => "User"
end
