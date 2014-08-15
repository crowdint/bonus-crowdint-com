Fabricator(:user) do
  email { sequence(:email) { |i| "test#{i}@example.com" } }
  name  { Faker::Name.name }

  password              "test1234"
  password_confirmation "test1234"
end

Fabricator(:admin_user, from: :user) do
  is_admin true
end
