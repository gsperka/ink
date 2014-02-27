User.create(username: 'user', password_digest: 'password', password_confirmation: 'password')
Tree.create(origin_id: 1)
Sketch.create(tree_id: 1, url: 'http://www.cbssports.com/images/collegefootball/squirrelheisman.jpg')
1.upto(10) do |n|
  Sketch.create(tree_id: 1, parent_id: 1, url: 'http://www.cbssports.com/images/collegefootball/squirrelheisman.jpg')
end