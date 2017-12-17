class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  attribute :awaken_time

  def awaken_time
    # &. is a safe navigation operator.
    # It checks for nil before calling a method.
    # It return `nil` if an object is `nil`.
    time = object.awakenings.today.first&.created_at
    return time unless time
    time.in_time_zone("Singapore").strftime("%I:%M %P")
  end
end
