# frozen_string_literal: true

class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
