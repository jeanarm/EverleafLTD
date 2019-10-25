class Usr < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :labels, dependent: :destroy
    validates :name, presence: true, length: {maximum: 40}
   validates :email, presence: true, length: {maximum: 200},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
   validates :email, uniqueness: true
   before_validation { email.downcase! }
   has_secure_password
  validates :password, presence: true
  def self.admins
    @users = Usr.all
  @admins=0
    @users.each do |user|
      if user.admin?
        @admins += 1
      end
    end
    return @admins
  end



end
