class Api::V2::UserSerializer < ApplicationSerializer
  attributes :id, :email, :auth_token, :created_at, :updated_at
end
