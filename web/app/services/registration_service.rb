class RegistrationService

  include HTTParty

  def initialize
    @url = Rails.configuration.x.api.url
  end

  def register(params)

    firstname = params[:firstname]
    lastname = params[:lastname]
    middlename = params[:middlename]
    age = params[:age]
    username = params[:username]
    password = params[:password]
    country = params[:country]
    state = params[:state]

    encryptor = EncryptPasswordService.new
    return response = self.class.post(@url + '/registers',
                               :body => {
                                   :username => username,
                                   :password => encryptor.encrypt(username, password),
                                   :firstname => firstname,
                                   :lastname => lastname,
                                   :middlename => middlename,
                                   :age => age,
                                   :country => country,
                                   :state => state
                               }.to_json,
                               :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} )

  end

  def getCountries
    return countries = self.class.get(@url + "/countries", :headers =>{'Content-Type' => 'application/json'})
  end

  def getStates
    return states = self.class.get(@url + "/states", :headers =>{'Content-Type' => 'application/json'})
  end

  def getStatesByCountry(countryId)
    return states = self.class.get(@url + "/states/statesByCountry/" + countryId , :headers =>{'Content-Type' => 'application/json'})
  end

end
