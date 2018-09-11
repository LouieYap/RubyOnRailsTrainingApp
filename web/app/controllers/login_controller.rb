class LoginController < ApplicationController
  layout false
  def new
    salt= Digest::SHA1.hexdigest("louieMagenic")
    encrypted_password= Digest::SHA1.hexdigest("#{salt}hans")
    @user = User.new(:password => encrypted_password, :username => 'louie', :person => Person.new)
    @user.save
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
    salt= Digest::SHA1.hexdigest("#{username}Magenic")
    encrypted_password= Digest::SHA1.hexdigest("#{salt}#{password}")
    User.find_by(username: username, password: encrypted_password)

  end


  end