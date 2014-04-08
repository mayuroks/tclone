class User < ActiveRecord::Base
  #attr_accessor :password
  validates_uniqueness_of :email
  has_many :tweets

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.password == password
  end
end
