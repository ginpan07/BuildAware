class StudentMood < ApplicationRecord
  belongs_to :student
  belongs_to :mood

  # validate :validate_student_mood_limit, on: :create

  # private

  # def validate_student_mood_limit
  #   if student.student_moods.count >= 2
  #     errors.add(:base, "Student can have only two activities")
  #   end
  # end
end
