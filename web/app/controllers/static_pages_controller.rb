class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  before_action :check_login_session, :only => [:home, :help]
end
