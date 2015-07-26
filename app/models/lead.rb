class Lead < ActiveRecord::Base
  belongs_to :group
  has_secure_password
  # before_save :encrypt_password

  validates_presence_of :group, on: :create
  validates_presence_of :password, on: :create
  validates :password, length: {minimum: 6}

  # def password
  # @password ||= Password.new()
  # end

  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end
end
