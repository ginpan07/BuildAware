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

# Happy - done
Activity.create(description: "Hug your best friend!", moods: "Happy")
Activity.create(description: "Check in with your best friend!", moods: "Happy")
Activity.create(description: "Dance with your teacher/friend!", moods: "Happy")
Activity.create(description: "Draw happiness on a piece of paper!", moods: "Happy")
Activity.create(description: "Ask a friend if they are okay", moods: "Happy")

# Angry - done
Activity.create(description: "Talk to a friend you like", moods: "Angry")
Activity.create(description: "Draw a picture of your anger", moods: "Angry")
Activity.create(description: "Run outside the classrom five times", moods: "Angry")
Activity.create(description: "Draw on a piece of paper!", moods: "Angry")
Activity.create(description: "Take 10 long breathes", moods: "Angry")

# Neutral -done
Activity.create(description: "Hug a teddy bear!", moods: "Neutral")
Activity.create(description: "Speed walk outside the classroom!", moods: "Neutral")
Activity.create(description: "Jog around the block!", moods: "Neutral")
Activity.create(description: "Draw on a piece of paper!", moods: "Neutral")
Activity.create(description: "Write on a piece of paper!", moods: "Neutral")

# Sad - done
Activity.create(description: "Hug a teddy bear!", moods: "Sad")
Activity.create(description: "Talk to a friend you trust", moods: "Sad")
Activity.create(description: "Take 10 calm belly breaths", moods: "Sad")
Activity.create(description: "Draw/Write sadness on a piece of paper", moods: "Sad")
Activity.create(description: "Listen to a music", moods: "Sad")

# Devastated - done
Activity.create(description: "Talk with teacher", moods: "Devastated")
Activity.create(description: "Chat with a friend", moods: "Devastated")
Activity.create(description: "Hug a teddy bear/someone you like", moods: "Devastated")
Activity.create(description: "Draw anything on a piece of paper", moods: "Devastated")
Activity.create(description: "Write down your feelings", moods: "Devastated")

StudentActivity.create(student_id: Student.first.id, activity_id: Activity.first.id)
StudentActivity.create(student_id: Student.second.id, activity_id: Activity.second.id)
StudentActivity.create(student_id: Student.third.id, activity_id: Activity.third.id)
StudentActivity.create(student_id: Student.fourth.id, activity_id: Activity.fourth.id)
StudentActivity.create(student_id: Student.fifth.id, activity_id: Activity.fifth.id)
