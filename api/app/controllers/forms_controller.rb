class FormsController < SecuredController

  def submit
    render json: 'OK', status: :ok
  end


end
