class StudentMood < ApplicationRecord
  belongs_to :student
  belongs_to :mood

  # validate :validate_record_count, on: :create, on: :update

  # private

  # def validate_record_count
  #   # Check the number of existing records
  #   if StudentMood.count >= 2
  #     errors.add(:base, "Only two records are allowed")
  #   end
  # end
end
