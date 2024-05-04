class ClassroomsController < ApplicationController
    def mood_summary
        @classroom = Classroom.find(params[:id])
        @mood_summary = calculate_mood_summary(@classroom.students)
    end
    
    private
    
    def calculate_mood_summary(students)
        summary = {}
        students.each do |student|
          student.moods.each do |mood|
            summary[mood] ||= 0
            summary[mood] += 1
          end
        end
        summary
    end
end
