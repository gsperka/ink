class User < ActiveRecord::Base
  has_secure_password

  has_many :sketches
  has_many :votes
  has_one :googleuser

  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :presence => true, :format => /.+@.+\..+/
  validates :username, :first_name, :last_name, :presence => true
  validates :username, :uniqueness => true

  def create_by_google_user(google_user)
    user = User.new
    user.username = google_user.name
    user.password = rand(36**12).to_s(36)
    # rather not need to validate false
    user.save(:validate => false)
    google_user.update(user_id: user.id)

    user
  end
end
