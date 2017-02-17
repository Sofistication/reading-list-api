# frozen_string_literal: true

class EntrySerializer < ActiveModel::Serializer
  attributes :id, :list
  has_one :reader
  has_one :book
end
