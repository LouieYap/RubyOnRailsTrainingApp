class LoginController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username], password: params[:password])
    if user.present?
      user.api_key = generate_api_key
      user.save
      render json: {token: user.api_key, id: user.id}, status: :ok
    else
      response.status = 401
    end
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end


end
