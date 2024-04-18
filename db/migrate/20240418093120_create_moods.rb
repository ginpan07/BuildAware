class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :moods
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
