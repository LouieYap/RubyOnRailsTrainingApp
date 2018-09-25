class UsersController < ApplicationController
  before_action :require_admin_user
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    encryptor = EncryptPasswordService.new

    @user = User.find(params[:id])
    if @user.update(username: user_params['username'], password: encryptor.encrypt(user_params['username'], user_params['password']), admin: user_params['admin'])
      flash[:notice] = 'Successfully edited user'
      redirect_to '/users'
    else
      flash[:error] = 'An error occurred'
      redirect_to '/users'
    end
  end

  def destroy

    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  before_action :set_user, only: [:edit, :update, :destroy]
end
