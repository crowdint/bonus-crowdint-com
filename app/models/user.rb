class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :awards
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :events, through: :teams

  def self.find_for_google_oauth2(oauth, current_user = nil)
    if valid_email?(oauth["info"]["email"])
      user = User.where(email: oauth["info"]["email"]).first

      unless user
        user                       = User.new
        user.email                 = oauth["info"]["email"]
        user.name                  = oauth["info"]["name"]
        user.password              = Devise.friendly_token[0,20]
        user.password_confirmation = user.password
        user.save
      end

      user
    end
  end

  def self.valid_email?(email)
    #!email.scan(/crowdint.com$/).empty?
    email.end_with?("crowdint.com")
  end
end
