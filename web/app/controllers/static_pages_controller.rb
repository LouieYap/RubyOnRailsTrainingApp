class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  before_action :check_login_session, :only => [:home, :help]
end
