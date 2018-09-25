class ApplicationController < ActionController::Base
  helper_method :admin_logged_in?
  def check_login_session
    if session[:user_id]
      return true
    else
      redirect_to(:controller => 'login', :action => 'new')

    end


  end

  def admin_logged_in?
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @user.admin
    end
  end

  def require_admin_user
    if !admin_logged_in?
      session[:user_id] = nil
      flash[:danger] = "You must be an Admin to do this action"
      redirect_to controller: 'login', action: 'new'
    end
  end


end
