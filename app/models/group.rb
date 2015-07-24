class Group < ActiveRecord::Base
  has_many :parts
  attr_accessor :password
  before_save :encrypt_password

  validates :groupname, presence: true, uniqueness: true
  validates_presence_of :password, on: :create
  validates :password, length: {minimum: 6}

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def parts_count
    parts.length
  end
end
