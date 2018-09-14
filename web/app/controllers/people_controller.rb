class PeopleController < ApplicationController
  #before_action :set_person, only: [:show, :edit, :update, :destroy]
  include HTTParty
  base_uri 'http://localhost:3001'
  # GET /people
  # GET /people.json
  def index
    @people = Array.new
    @personApi = self.class.get('/people', :headers =>{'Content-Type' => 'application/json'})

    @personApi.each do |doc|
      person = Person.new
      person.firstname = doc['firstname']
      person.lastname = doc['lastname']
      person.middlename = doc['middlename']
      person.age = doc['age']
      @people << person
    end
    return @people

  end

  # GET /people/1/edit
  def edit
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:firstname, :lastname, :middlename, :age)
    end
end
