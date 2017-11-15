class AwakeningSerializer < ActiveModel::Serializer
  attribute :created_at, key: :time
end
