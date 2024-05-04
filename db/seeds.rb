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
    classroom_id: classroom.id,
  )

  # student.mood.build(mood: "happy")

  if student.save
    puts "User created with email: #{student.email}"
  else
    puts "Error creating user: #{student.errors.full_messages}"
  end
end

# Create moods for each student
Student.all.each do |student|
  # Generate a random mood for each student
  mood = ["Happy", "Angry", "Neutral", "Sad", "Devastated"].sample
  # Create the mood record for the student
  student.moods.create!(mood: mood)
end

# Happy - done
Activity.create(description: "Hug your best friend!", mood: "Happy")
Activity.create(description: "Check in with your best friend!", mood: "Happy")
Activity.create(description: "Dance with your teacher/friend!", mood: "Happy")
Activity.create(description: "Draw happiness on a piece of paper!", mood: "Happy")
Activity.create(description: "Ask a friend if they are okay", mood: "Happy")

# Angry - done
Activity.create(description: "Talk to a friend you like", mood: "Angry")
Activity.create(description: "Draw a picture of your anger", mood: "Angry")
Activity.create(description: "Run outside the classrom five times", mood: "Angry")
Activity.create(description: "Draw on a piece of paper!", mood: "Angry")
Activity.create(description: "Take 10 long breathes", mood: "Angry")

# Neutral -done
Activity.create(description: "Hug a teddy bear!", mood: "Neutral")
Activity.create(description: "Speed walk outside the classroom!", mood: "Neutral")
Activity.create(description: "Jog around the block!", mood: "Neutral")
Activity.create(description: "Draw on a piece of paper!", mood: "Neutral")
Activity.create(description: "Write on a piece of paper!", mood: "Neutral")

# Sad - done
Activity.create(description: "Hug a teddy bear!", mood: "Sad")
Activity.create(description: "Talk to a friend you trust", mood: "Sad")
Activity.create(description: "Take 10 calm belly breaths", mood: "Sad")
Activity.create(description: "Draw/Write sadness on a piece of paper", mood: "Sad")
Activity.create(description: "Listen to a music", mood: "Sad")

# Devastated - done
Activity.create(description: "Talk with teacher", mood: "Devastated")
Activity.create(description: "Chat with a friend", mood: "Devastated")
Activity.create(description: "Hug a teddy bear/someone you like", mood: "Devastated")
Activity.create(description: "Draw anything on a piece of paper", mood: "Devastated")
Activity.create(description: "Write down your feelings", mood: "Devastated")

StudentActivity.create(student_id: Student.first.id, activity_id: Activity.first.id)
StudentActivity.create(student_id: Student.second.id, activity_id: Activity.second.id)
StudentActivity.create(student_id: Student.third.id, activity_id: Activity.third.id)
StudentActivity.create(student_id: Student.fourth.id, activity_id: Activity.fourth.id)
StudentActivity.create(student_id: Student.fifth.id, activity_id: Activity.fifth.id)
StudentActivity.create(student_id: Student.find(6).id, activity_id: Activity.find(6).id)
StudentActivity.create(student_id: Student.find(7).id, activity_id: Activity.find(7).id)
StudentActivity.create(student_id: Student.find(8).id, activity_id: Activity.find(8).id)
StudentActivity.create(student_id: Student.find(9).id, activity_id: Activity.find(9).id)
StudentActivity.create(student_id: Student.find(10).id, activity_id: Activity.find(10).id)
StudentActivity.create(student_id: Student.find(1).id, activity_id: Activity.find(11).id)
StudentActivity.create(student_id: Student.find(2).id, activity_id: Activity.find(12).id)
StudentActivity.create(student_id: Student.find(3).id, activity_id: Activity.find(13).id)
StudentActivity.create(student_id: Student.find(4).id, activity_id: Activity.find(14).id)
StudentActivity.create(student_id: Student.find(5).id, activity_id: Activity.find(15).id)
StudentActivity.create(student_id: Student.find(6).id, activity_id: Activity.find(16).id)
StudentActivity.create(student_id: Student.find(7).id, activity_id: Activity.find(17).id)
StudentActivity.create(student_id: Student.find(8).id, activity_id: Activity.find(18).id)
StudentActivity.create(student_id: Student.find(9).id, activity_id: Activity.find(19).id)
StudentActivity.create(student_id: Student.find(10).id, activity_id: Activity.find(20).id)
StudentActivity.create(student_id: Student.find(1).id, activity_id: Activity.find(21).id)
StudentActivity.create(student_id: Student.find(2).id, activity_id: Activity.find(22).id)
StudentActivity.create(student_id: Student.find(3).id, activity_id: Activity.find(23).id)
StudentActivity.create(student_id: Student.find(4).id, activity_id: Activity.find(24).id)
StudentActivity.create(student_id: Student.find(5).id, activity_id: Activity.find(25).id)
