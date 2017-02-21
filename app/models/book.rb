# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :users, through: :readings
  has_many :readings

  validates :title, presence: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :user, presence: true
end
