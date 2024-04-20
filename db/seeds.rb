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

classroom1 = Classroom.new(teacher_id: 1, student_id: 1)
classroom1.save

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

StudentActivity.create(activities: "Hug", image: "https://cdn.iconscout.com/icon/premium/png-256-thumb/hug-1488452-1259796.png", student_id: 1)
StudentActivity.create(activities: "Walk", image: "https://cdn.iconscout.com/icon/premium/png-256-thumb/walk-109066.png", student_id: 2)
StudentActivity.create(activities: "Dance", image: "https://cdn-icons-png.freepik.com/512/7779/7779711.png", student_id: 3)
StudentActivity.create(activities: "Draw", image: "https://cdn-icons-png.flaticon.com/512/191/191714.png", student_id: 4)
StudentActivity.create(activities: "Write", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2r_-qet7K5aYWPwSujqWgB7HNEp9Vmchgsxd1KbGvQw&s", student_id: 5)
