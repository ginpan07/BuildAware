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

teacher = Teacher.new(
  name: Faker::Name.first_name,
  email: Faker::Internet.email,
  password: '123456',
  role: 'teacher'
)

if teacher.save
  puts "Teacher created with email: #{teacher.email}"
else
  puts "Error creating user: #{teacher.errors.full_messages}"
end

10.times do
  classroom = Classroom.new(
    teacher_id: 1,
    name: Faker::Name.first_name
  )

  if classroom.save
    puts "Classroom created with name: #{classroom.name}"
  else
    puts "Error creating user: #{classroom.errors.full_messages}"
  end
end
# Create a Classroom instance
# teacher = Teacher.create!(
#   name: Faker::Name.first_name,
#   email: Faker::Internet.email,
#   password: '123456',
#   role: 'teacher'
# )
# classroom = Classroom.create!(
#   teacher: teacher,
#   name: Faker::Name.first_name
# )

# if teacher.save
#   puts "Teacher created with email: #{teacher.email}"
# else
#   puts "Error creating user: #{teacher.errors.full_messages}"
# end
# puts classroom
# Create Student instances associated with the Classroom

10.times do
  student = Student.new(
    name: Faker::Name.first_name,
    age: rand(6..12),
    email: Faker::Internet.email,
    password: '123456',
    classroom_id: 1,
    role: 'student'
  )

  # student.mood.build(mood: "happy")

  if student.save
    puts "Student created with email: #{student.email}"
  else
    puts "Error creating user: #{student.errors.full_messages}"
  end
end


happy = Mood.new(mood: "happy")
happy.save
angry = Mood.new(mood: "angry")
angry.save
neutral = Mood.new(mood: "neutral")
neutral.save
sad = Mood.new(mood: "sad")
sad.save
devastated = Mood.new(mood: "devastated")
devastated.save

StudentMood.create(student_id: 1, mood_id: 1)
StudentMood.create(student_id: 1, mood_id: 1)
StudentMood.create(student_id: 2, mood_id: 2)
StudentMood.create(student_id: 3, mood_id: 3)
StudentMood.create(student_id: 4, mood_id: 4)
StudentMood.create(student_id: 5, mood_id: 5)

# Happy - done
Activity.create(description: "Hug your best friend!", mood: happy.mood)
Activity.create(description: "Check in with your best friend!", mood: happy.mood)
Activity.create(description: "Dance with your teacher/friend!", mood: happy.mood)
Activity.create(description: "Draw happiness on a piece of paper!", mood: happy.mood)
Activity.create(description: "Ask a friend if they are okay", mood: happy.mood)

# Angry - done
Activity.create(description: "Talk to a friend you like", mood: angry.mood)
Activity.create(description: "Draw a picture of your anger", mood: angry.mood)
Activity.create(description: "Run outside the classrom five times", mood: angry.mood)
Activity.create(description: "Draw on a piece of paper!", mood: angry.mood)
Activity.create(description: "Take 10 long breathes", mood: angry.mood)

# Neutral -done
Activity.create(description: "Hug a teddy bear!", mood: neutral.mood)
Activity.create(description: "Speed walk outside the classroom!", mood: neutral.mood)
Activity.create(description: "Jog around the block!", mood: neutral.mood)
Activity.create(description: "Draw on a piece of paper!", mood: neutral.mood)
Activity.create(description: "Write on a piece of paper!", mood: neutral.mood)

# Sad - done
Activity.create(description: "Hug a teddy bear!", mood: sad.mood)
Activity.create(description: "Talk to a friend you trust", mood: sad.mood)
Activity.create(description: "Take 10 calm belly breaths", mood: sad.mood)
Activity.create(description: "Draw/Write sadness on a piece of paper", mood: sad.mood)
Activity.create(description: "Listen to a music", mood: sad.mood)

# Devastated - done
Activity.create(description: "Talk with teacher", mood: devastated.mood)
Activity.create(description: "Chat with a friend", mood: devastated.mood)
Activity.create(description: "Hug a teddy bear/someone you like", mood: devastated.mood)
Activity.create(description: "Draw anything on a piece of paper", mood: devastated.mood)
Activity.create(description: "Write down your feelings", mood: devastated.mood)

# StudentActivity.create(student_id: Student.first.id, activity_id: Activity.first.id)
# StudentActivity.create(student_id: Student.second.id, activity_id: Activity.second.id)
# StudentActivity.create(student_id: Student.third.id, activity_id: Activity.third.id)
# StudentActivity.create(student_id: Student.fourth.id, activity_id: Activity.fourth.id)
# StudentActivity.create(student_id: Student.fifth.id, activity_id: Activity.fifth.id)
# StudentActivity.create(student_id: Student.find(6).id, activity_id: Activity.find(6).id)
# StudentActivity.create(student_id: Student.find(7).id, activity_id: Activity.find(7).id)
# StudentActivity.create(student_id: Student.find(8).id, activity_id: Activity.find(8).id)
# StudentActivity.create(student_id: Student.find(9).id, activity_id: Activity.find(9).id)
# StudentActivity.create(student_id: Student.find(10).id, activity_id: Activity.find(10).id)
# StudentActivity.create(student_id: Student.find(1).id, activity_id: Activity.find(11).id)
# StudentActivity.create(student_id: Student.find(2).id, activity_id: Activity.find(12).id)
# StudentActivity.create(student_id: Student.find(3).id, activity_id: Activity.find(13).id)
# StudentActivity.create(student_id: Student.find(4).id, activity_id: Activity.find(14).id)
# StudentActivity.create(student_id: Student.find(5).id, activity_id: Activity.find(15).id)
# StudentActivity.create(student_id: Student.find(6).id, activity_id: Activity.find(16).id)
# StudentActivity.create(student_id: Student.find(7).id, activity_id: Activity.find(17).id)
# StudentActivity.create(student_id: Student.find(8).id, activity_id: Activity.find(18).id)
# StudentActivity.create(student_id: Student.find(9).id, activity_id: Activity.find(19).id)
# StudentActivity.create(student_id: Student.find(10).id, activity_id: Activity.find(20).id)
# StudentActivity.create(student_id: Student.find(1).id, activity_id: Activity.find(21).id)
# StudentActivity.create(student_id: Student.find(2).id, activity_id: Activity.find(22).id)
# StudentActivity.create(student_id: Student.find(3).id, activity_id: Activity.find(23).id)
# StudentActivity.create(student_id: Student.find(4).id, activity_id: Activity.find(24).id)
# StudentActivity.create(student_id: Student.find(5).id, activity_id: Activity.find(25).id)
