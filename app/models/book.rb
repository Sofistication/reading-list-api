# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :readers, through: :entries
  has_many :entries

  validates :title, presence: true
  validates :author, presence: true
  validates :published_in, presence: true
end
