user                       = User.new
user.email                 = 'test@example.com'
user.password              = 'test1234'
user.password_confirmation = 'test1234'
user.is_admin              = true
user.save!

user                       = User.new
user.name                  = "Robert Rodriguez"
user.email                 = 'test2@example.com'
user.password              = 'test1234'
user.password_confirmation = 'test1234'
user.is_admin              = true
user.save!


