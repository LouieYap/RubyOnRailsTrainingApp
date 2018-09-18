class StaticPagesController < ApplicationController
  include HTTParty
  def home
  end

  def help
  end

  def form
  end

  def form_submit
    response = self.class.post('http://localhost:3001/form',
                               :body => {
                                   :full_name => params['/form']['full_name'],
                                   :email_address => params['/form']['email_address'],
                                   :gender => params['/form']['gender'],
                                   :blood_type => params['/form']['blood_type']
                               }.to_json,
                               :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json', 'Authorization' => "Bearer " + "#{session[:token]}"})
    if response.response.code == '200'
      flash[:message] = 'Successfully submitted form'
    else
      flash[:danger] = 'Error Occurred'

    end
    redirect_to form_path
  end


  def logout
    session[:user_id] = nil
    session[:token] = nil
    redirect_to login_path
  end

  before_action :check_login_session, :only => [:home, :help]
end
