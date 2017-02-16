# frozen_string_literal: true

class CreateReaders < ActiveRecord::Migration[5.0]
  def change
    create_table :readers do |t|
      t.string :given_name, null: false
      t.string :family_name

      t.timestamps null: false
    end
  end
end
