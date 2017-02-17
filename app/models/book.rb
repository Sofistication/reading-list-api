# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :user, presence: true
end
