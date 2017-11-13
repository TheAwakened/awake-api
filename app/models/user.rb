class User < ApplicationRecord

  has_many :awakenings
  has_secure_password
end
