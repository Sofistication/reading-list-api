# frozen_string_literal: true

class Reader < ApplicationRecord
  validates :given_name, presence: true
end
