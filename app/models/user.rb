class User < ActiveRecord::Base
  has_many :rating

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, length: { minimum: 8 }, allow_nil: true
  before_save { email.downcase! }
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    return nil unless user && user.authenticate(password)
    user
  end
end

