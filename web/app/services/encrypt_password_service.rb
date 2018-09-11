class EncryptPasswordService


  def encrypt(username, password)
    salt= Digest::SHA1.hexdigest("#{username}Magenic")
    encrypted_password= Digest::SHA1.hexdigest("#{salt}#{password}")
  end
end
