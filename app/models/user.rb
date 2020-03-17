class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password
end
