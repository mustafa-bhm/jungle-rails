class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 3}

  private

  def self.authenticate_with_credentials(email, password)

    if email == nil || password == nil
      return false

    else
      user_email = email.downcase.strip

      user = User.find_by_email(user_email)

      user && user.authenticate(password) ? user : false
    end

  end



end