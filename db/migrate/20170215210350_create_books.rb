# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :published_in, null: false
      t.references :user, foreign_key: true, null: false, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
