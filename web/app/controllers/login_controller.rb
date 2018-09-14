class LoginController < ApplicationController
  layout false

  def new
  end

  def create

    @user =  authenticate(params[:login][:username],params[:login][:password])

    if @user
    session[:user_id] = @user.id
    redirect_to home_path
    else
      flash[:danger] = 'Invalid username/password combination'
    redirect_to login_path
  end

  end

  def authenticate(username, password)
    service = EncryptPasswordService.new
    encrypted_password= service.encrypt(username, password)
    User.find_by(username: username, password: encrypted_password)

  end



  end