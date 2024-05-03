class StudentMood < ApplicationRecord
  belongs_to :student
  belongs_to :mood
end
