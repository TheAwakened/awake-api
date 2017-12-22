class User < ApplicationRecord
  has_many :awakenings
  has_secure_password
  validates :username, uniqueness: true

  def awake_today?
    awakenings.today.present?
  end

  def generate_api_key
    self.update_column(:api_key, SecureRandom.hex(16))
  end

end


