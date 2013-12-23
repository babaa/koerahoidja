class User < ActiveRecord::Base
  has_many :photos
  belongs_to :county 
  belongs_to :parish 
  belongs_to :town

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  def self.authenticate(email="", login_password="")
    if EMAIL_REGEX.match(email)    
      user = User.find_by_email(email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def parish_town=val
    self.parish = Parish.find_by(name: val)
    self.town = Town.find_by(name: val)
  end

  def parish_town
    return parish.name if parish
    return town.name if town
  end

end
