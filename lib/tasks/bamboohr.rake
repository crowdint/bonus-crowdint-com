namespace :bamboohr do
  desc "Import users from BambooHR"
  task import: :environment do
    client = BambooHR::Client.new
    client.subdomain = "crowdint"
    client.key = ENV["BAMBOO_API_KEY"]

    employees = client.employee_list

    employees["employees"].each do |employee|
      user = User.where(email: employee["workEmail"]).first
      unless user
        user = User.new
        user.email = employee["workEmail"]
        user.name = employee["displayName"]
        user.password = Devise.friendly_token[0,20]
        user.password_confirmation = user.password
        user.save
      end
    end
  end
end
