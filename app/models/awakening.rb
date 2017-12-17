class Awakening < ApplicationRecord
  belongs_to :user

  scope :today, -> { where('created_at >= ?', Time.zone.today) }

  def time
    self.created_at
  end
end
