class AddRoleToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :role, :string
  end
end
