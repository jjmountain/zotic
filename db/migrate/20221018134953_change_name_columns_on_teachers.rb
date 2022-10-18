class ChangeNameColumnsOnTeachers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :teachers, :first_name, true
    change_column_null :teachers, :last_name, true
  end
end
