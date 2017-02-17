# frozen_string_literal: true

class Reader < ApplicationRecord
  has_many :books, through: :entries
  has_many :entries

  validates :given_name, presence: true
end
