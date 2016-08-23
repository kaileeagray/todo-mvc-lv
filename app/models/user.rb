class User < ApplicationRecord
  validates :email, :presence => true
  validates :email, :uniqueness => true
  has_secure_password


  def self.find_or_create_by_omniauth(auth)
    oauth_email = auth["info"]["email"] || auth["info"]["nickname"] || auth["info"]["name"]
    self.where(:email => oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end
end
