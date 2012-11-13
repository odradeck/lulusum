class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :validatable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :current_password
  attr_accessible :email, :password, :password_confirmation, :remember_me, :current_password
  attr_accessible :uid, :name, :phone
  
  #for Oauth
  has_many :services, :dependent => :destroy
  
  def completeform?
    if self.phone
      true
    else
      false
    end
  end
  
  def image_url
     if self.services.count > 0
      img_url_string = "https://graph.facebook.com/" +  String(self.services.first.uid) + "/picture"
    else
      img_url_string = "/anyone.png"
    end
    img_url_string
  end
  
    def avatar_image_url
     if self.services.count > 0
      img_url_string = "https://graph.facebook.com/" +  String(self.services.first.uid) + "/picture"
    else
      img_url_string = "/anyone.png"
    end
    img_url_string
  end
end
