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

    encryptor = EncryptPasswordService.new
    return response = self.class.post(@url + '/registers',
                               :body => {
                                   :username => username,
                                   :password => encryptor.encrypt(username, password),
                                   :firstname => firstname,
                                   :lastname => lastname,
                                   :middlename => middlename,
                                   :age => age
                               }.to_json,
                               :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} )

  end

  def getCountries
    return countries = self.class.get(@url + "/countries", :headers =>{'Content-Type' => 'application/json'})
  end
end
