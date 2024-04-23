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

# Create a Classroom instance
teacher = Teacher.create!(
  name: Faker::Name.first_name,
  email: Faker::Internet.email,
  password: '123456'
)
classroom = Classroom.create!(
  teacher: teacher
)
# puts classroom
# Create Student instances associated with the Classroom
10.times do
  student = Student.new(
    name: Faker::Name.first_name,
    age: Faker::Number.number(digits: 2),
    email: Faker::Internet.email,
    password: '123456',
    classroom_id: classroom.id
  )

  if student.save
    puts "User created with email: #{student.email}"
  else
    puts "Error creating user: #{student.errors.full_messages}"
  end
end
