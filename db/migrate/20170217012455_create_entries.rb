# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :list
      t.references :reader, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false

      t.timestamps
    end
  end
end
