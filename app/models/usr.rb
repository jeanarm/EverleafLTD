class Usr < ApplicationRecord
    has_many :tasks
    validates :name, presence: true, length: {maximum: 40}
   validates :email, presence: true, length: {maximum: 200},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
   before_validation { email.downcase! }
   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }

end
