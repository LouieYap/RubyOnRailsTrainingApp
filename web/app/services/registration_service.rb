class RegistrationService

  include HTTParty

  def initialize(params)
    @firstname = params[:firstname]
    @lastname = params[:lastname]
    @middlename = params[:middlename]
    @age = params[:age]
    @username = params[:username]
    @password = params[:password]
  end

  def register
    encryptor = EncryptPasswordService.new

    url = Rails.configuration.api_url + '/registers'

    return response = self.class.post(url,
                               :body => {
                                   :username => @username,
                                   :password => encryptor.encrypt(@username, @password),
                                   :firstname => @firstname,
                                   :lastname => @lastname,
                                   :middlename => @middlename,
                                   :age => @age
                               }.to_json,
                               :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} )

  end
end
