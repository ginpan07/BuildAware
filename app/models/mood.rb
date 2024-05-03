class Mood < ApplicationRecord
  has_many :students, through: :student_moods
  has_many :student_moods
end
