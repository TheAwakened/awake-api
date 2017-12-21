class User < ApplicationRecord
  has_many :awakenings
  has_secure_password
  validates :username, uniqueness: true

  def awake_today?
    awakenings.today.present?
  end
end


