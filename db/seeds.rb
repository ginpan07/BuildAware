# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

# classroom1 = Classroom.new(teacher_id: 1, student_id: 1)
# classroom1.save

10.times do
  student1 = Student.new(
    name: Faker::Name.first_name,
    age: Faker::Number.number(digits: 2),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  if student1.save
    puts "User created with email: #{student1.email}"
  else
    puts "Error creating user: #{student1.errors.full_messages}"
  end
end
