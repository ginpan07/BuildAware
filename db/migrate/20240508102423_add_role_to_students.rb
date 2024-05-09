class AddRoleToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :role, :string
  end
end
