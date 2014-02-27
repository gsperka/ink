class User < ActiveRecord::Base
  has_many :sketches
  has_many :votes
end
