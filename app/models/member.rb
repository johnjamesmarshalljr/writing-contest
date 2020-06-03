class Member < ActiveRecord::Base
   validates :email, :password, presence: true
   validates :email, uniqueness: true
   has_secure_password
  has_many :submissions
end
