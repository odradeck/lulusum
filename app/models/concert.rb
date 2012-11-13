class Concert < ActiveRecord::Base
  attr_accessible :available, :breakday, :category, :description, :enddate, :poster, :price, :reflink, :score, :startdate, :status, :title
  
  has_many :relationship_favorit_concerts, :dependent => :destroy
  has_many :favorit_users, :through=> :relationship_favorit_concerts, :source => :user
  
  has_many :tickets
end
