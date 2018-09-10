class RegistersController < ApplicationController
  #before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @register = Register.new
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    format.html { redirect_to @register, notice: 'Register was successfully created.' }
    format.json { render :show, status: :created, location: @register }

=begin
    respond_to do |format|
      if @user.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:firstname, :lastname, :middlename, :age, :username)
    end
end
