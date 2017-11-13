class Awakening < ApplicationRecord
  belongs_to :user

  def time
    self.created_at
  end
end
