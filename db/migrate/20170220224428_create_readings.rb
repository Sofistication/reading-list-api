# frozen_string_literal: true

class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :book, foreign_key: true, null: false, index: true
      t.string :list
      t.string :status

      t.timestamps
    end
  end
end
