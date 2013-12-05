class User < ActiveRecord::Base
  devise :database_authenticatable, :token_authenticatable, :trackable, :omniauthable
end
