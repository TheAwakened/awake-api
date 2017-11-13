class User < ApplicationRecord
  has_many :awakenings
  has_secure_password
  validates :username, uniqueness: true

  def self.from_token_request(request)
    # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
    # e.g.
    username = request.params["auth"] && request.params["auth"]["username"]
    self.find_by username: username
  end

end


