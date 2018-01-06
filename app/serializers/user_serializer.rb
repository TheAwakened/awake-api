class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  attribute :awaken_time

  def awaken_time
    # &. is a safe navigation operator.
    # It checks for nil before calling a method.
    # It return `nil` if an object is `nil`.
    return nil unless object.respond_to? "created_at"
    time = object.created_at
    time.in_time_zone("Singapore").strftime("%I:%M %P")
  end
end
