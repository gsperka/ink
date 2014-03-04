user = User.new
user.username = "anon"
user.first_name = "Anon"
user.last_name = "Ymous"
user.email = "anon@eversketch.co"
user.password_digest = "unguessable"
user.save(:validate => false)
