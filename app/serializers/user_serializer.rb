#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_user, :first_name, :last_name

  def current_user
    scope == object
  end
end
