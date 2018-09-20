class Register
  include ActiveModel::Model
  def id
    @id
  end
  def id=(id)
  end
  def firstname
    @firstname
  end
  def firstname=(firstname)
    @firstname = firstname
  end
  def lastname
    @lastname
  end
  def lastname=(lastname)
    @lastname = lastname
  end
  def middlename
    @middlename
  end
  def middlename=(middlename)
    @middlename=middlename
  end
  def age
  end
  def age=(age)
    @age = age
  end
  def country
  end
  def country=(country)
    @country = country
  end
  def username
  end
  def username=(username)
  end
  def password
    @password
  end
  def password=(password)
    @password = password
  end
end
