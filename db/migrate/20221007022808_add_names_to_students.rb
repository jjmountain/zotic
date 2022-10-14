class AddNamesToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :student_number, :string
  end
end
