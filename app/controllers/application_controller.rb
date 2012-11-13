class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource_or_scope)

    if current_user.completeform? == false
      edit_user_registration_path
    else
      stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
    end

    
    #edit_user_registration_path
  end
 
end
