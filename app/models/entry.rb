# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :reader
  belongs_to :book
end
