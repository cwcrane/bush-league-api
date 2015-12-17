class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :user_id
end
