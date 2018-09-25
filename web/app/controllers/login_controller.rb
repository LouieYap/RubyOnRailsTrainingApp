class LoginController < ApplicationController
  #layout false
  include HTTParty

  def new
    session[:user_id] = nil
  end

  def create
    service = EncryptPasswordService.new
    encrypted_password = service.encrypt(params[:login][:username], params[:login][:password])
    response = self.class.post('http://localhost:3001/authenticate',
                               :body => {
                                   :username => params[:login][:username],
                                   :password => encrypted_password
                               }.to_json,
                               :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'})


      if response.response.code == '200'
        body =  JSON.parse(response.response.body)
        session[:user_id] = body['id']
        session[:token] = body['token']
        redirect_to home_path

      else
        flash[:danger] = 'Invalid username/password combination'
        redirect_to login_path
      end

    end
  end
