class ApplicationController < ActionController::Base

  def check_login_session
    if session[:user_id]
      return true
    else
      redirect_to(:controller => 'login', :action => 'new')

    end
  end


end
