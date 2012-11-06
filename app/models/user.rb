class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password, :password_confirmation, :current_password
  attr_accessible :email, :password, :password_confirmation, :remember_me, :current_password
  attr_accessible :uid, :name, :phone
  
  #for Oauth
  has_many :services, :dependent => :destroy
end
