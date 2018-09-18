class RegistersController < ApplicationController
  layout false
  include HTTParty
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

  def create

    encryptor = EncryptPasswordService.new

    response = RegistrationService.new({
                                           firstname:register_params['firstname'],
                                           lastname:register_params['lastname'],
                                           middlename:register_params['middlename'],
                                           username:register_params['username'],
                                           age:register_params['age'],
                                       }).register

    respond_to do |format|
      if response.response.code == '201'
        format.html { redirect_to registers_path, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def create3

    encryptor = EncryptPasswordService.new

    response = self.class.post('http://localhost:3001/registers',
                      :body => {
                          :username => register_params['username'],
                          :password => encryptor.encrypt(register_params['username'], register_params['password']),
                          :firstname => register_params['firstname'],
                          :lastname => register_params['lastname'],
                          :middlename => register_params['middlename'],
                          :age => register_params['age']
                      }.to_json,
                      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} )



    respond_to do |format|
      if response.response.code == '201'
        format.html { redirect_to registers_path, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /registers
  # POST /registers.json
  def create2

    user = User.new
    user.username = register_params['username']
    user.password = register_params['username']

    person = Person.new
    person.user = user
    person.firstname = register_params['firstname']
    person.lastname = register_params['firstname']
    person.middlename = register_params['firstname']
    person.age = register_params['age']

    person_params = ActionController::Parameters.new({
        :firstname => person.firstname,
        :lastname => person.lastname,
        :middlename => person.middlename,
        :age => person.age
    })

    person_params.permit!
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save

        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

=begin
    @register = Register.new(register_params)

    format.html { redirect_to @register, notice: 'Register was successfully created.' }
    format.json { render :show, status: :created, location: @register }
=end

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
      params.require(:register).permit(:firstname, :lastname, :middlename, :age, :username, :password)
    end
end
