class AddFirstNameToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :first_name, :string, null: false
    add_column :teachers, :last_name, :string, null: false
  end
end
