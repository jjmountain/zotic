class AddNamesToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :first_name, :string, null: false
    add_column :students, :last_name, :string, null: false
    add_column :students, :student_number, :string
  end
end
