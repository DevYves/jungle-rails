# class User < ActiveRecord::Base
#   has_secure_password
#   has_many :reviews

# validates :password, length: { minimum: 8 }, allow_nil: true
# validates :email, presence: true, :uniqueness => {:case_sensitive => false}

# class User < ActiveRecord::Base

#   has_secure_password
#   has_many :reviews
#   validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :email, presence: true, :uniqueness => {:case_sensitive => false}
#   validates :password, presence: true, length: { minimum: 8 }
#   validates :password_confirmation, presence: true

# end
# end


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

