# frozen_string_literal: true

class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :list, :status, :book
  has_one :user
  has_one :book

  def book
    object.book
  end
end
