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
  teacher: teacher,
  name: Faker::Name.first_name
)

# puts classroom
# Create Student instances associated with the Classroom

10.times do
  student = Student.new(
    name: Faker::Name.first_name,
    age: Faker::Number.number(digits: 1),
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

# Happy
Activity.create(description: "Hug a teddy bear!")
Activity.create(description: "Speed walk outside the classroom!")
Activity.create(description: "Dance with your teacher/friend!")
Activity.create(description: "Draw anger on a piece of paper!")
Activity.create(description: "Ask a friend if they are okay")

# Angry - done
Activity.create(description: "Talk to a friend you like")
Activity.create(description: "Draw a picture of your anger")
Activity.create(description: "Run outside the classrom five times")
Activity.create(description: "Draw on a piece of paper!")
Activity.create(description: "Take 10 long breathes")

# Neutral
Activity.create(description: "Hug a teddy bear!")
Activity.create(description: "Speed walk outside the classroom!")
Activity.create(description: "Dance with your teacher/friend!")
Activity.create(description: "Draw on a piece of paper!")
Activity.create(description: "Write on a piece of paper!")

# Sad - done
Activity.create(description: "Hug a teddy bear!")
Activity.create(description: "Talk to a friend you trust")
Activity.create(description: "Take 10 calm belly breaths")
Activity.create(description: "Draw/Write sadness on a piece of paper!")
Activity.create(description: "Listen to music")

# Devastated
Activity.create(description: "Hug a teddy bear!")
Activity.create(description: "Speed walk outside the classroom!")
Activity.create(description: "Dance with your teacher/friend!")
Activity.create(description: "Draw anger on a piece of paper!")
Activity.create(description: "Ask a friend if they are okay")

StudentActivity.create(student_id: Student.first.id, activity_id: Activity.first.id)
StudentActivity.create(student_id: Student.second.id, activity_id: Activity.second.id)
StudentActivity.create(student_id: Student.third.id, activity_id: Activity.third.id)
StudentActivity.create(student_id: Student.fourth.id, activity_id: Activity.fourth.id)
StudentActivity.create(student_id: Student.fifth.id, activity_id: Activity.fifth.id)
