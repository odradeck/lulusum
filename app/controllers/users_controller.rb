class UsersController < ApplicationController
  before_filter :correct_user,  only: [:show, :edit, :update]
  before_filter :admin_user, only: [:set_admin, :unset_admin, :index, :destory]
     
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:  @user }
    end
  end
  
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def set_admin
    user = User.find(params[:id])
    user.admin = true
    user.save
    redirect_to user    
  end
  
  def love
    @users = current_user.t_users
  end
  
  def unset_admin
    user = User.find(params[:id])
    user.admin = false
    user.save
    redirect_to user    
  end
  
    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
private
    def correct_user
      @user = User.find(params[:id])
            
      #redirect_to(root_path) unless current_user?(@user)
      redirect_to root_path, notice: "Yon can not handle other user" unless current_user==@user || current_user.admin?
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
