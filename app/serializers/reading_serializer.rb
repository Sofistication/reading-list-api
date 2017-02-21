# frozen_string_literal: true

class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :list, :status
  has_one :user
  has_one :book
end
