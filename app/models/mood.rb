class Mood < ApplicationRecord
  has_many :student_moods
  has_many :students, through: :student_moods
end
