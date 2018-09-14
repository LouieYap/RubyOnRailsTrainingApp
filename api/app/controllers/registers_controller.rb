class RegistersController < ApplicationController
  #before_action :set_register, only: [:show, :update, :destroy]

  # POST /registers
  def create

    user = User.new
    user.username = register_params['username']
    user.password = register_params['password']

    person = Person.new
    person.user = user
    person.firstname = register_params['firstname']
    person.lastname = register_params['lastname']
    person.middlename = register_params['middlename']
    person.age = register_params['age']

    Person.transaction do
      user.save!
      person.user_id = user.id
      person.save!
      end

    if person.user_id
      render json: @register, status: :created, location: @register
    else
      render json: @register.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def register_params
      params.require(:register).permit(:firstname, :lastname, :middlename, :age, :username, :password)
    end
end
