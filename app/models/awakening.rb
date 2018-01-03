class Awakening < ApplicationRecord
  belongs_to :user

  scope :today, -> { where('created_at >= ?', Awakening.today_time) }

  def time
    self.created_at
  end

  def self.today_time
    Time.use_zone("Singapore") { Date.today.in_time_zone }.utc
  end
end
