# frozen_string_literal: true

class DeviseCreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      ## Database authenticatable
      t.string :email, null: false

      t.timestamps null: false
    end

    add_index :students, :email, unique: true
  end
end
