class Concert < ActiveRecord::Base
  attr_accessible :available, :breakday, :category, :description, :enddate, :poster, :price, :reflink, :score, :startdate, :status, :title
  attr_accessible :location, :schedules_attributes  
  
  has_many :relationship_favorit_concerts, :dependent => :destroy
  has_many :favorit_users, :through=> :relationship_favorit_concerts, :source => :user
  
  has_many :tickets
  has_many :schedules
  accepts_nested_attributes_for :schedules, allow_destroy: true
  
end
