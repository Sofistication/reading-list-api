class ReaderSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name
end