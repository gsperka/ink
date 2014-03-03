class User < ActiveRecord::Base
  has_secure_password

  has_many :sketches
  has_many :votes

  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :presence => true
  validates :username, :first_name, :last_name, :presence => true
  validates :username, :uniqueness => true
end
