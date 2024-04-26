class AddNameToClassrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :classrooms, :name, :string
  end
end
