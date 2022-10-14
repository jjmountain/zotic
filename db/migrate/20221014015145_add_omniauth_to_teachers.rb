class AddOmniauthToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :provider, :string
    add_column :teachers, :uid, :string
  end
end
