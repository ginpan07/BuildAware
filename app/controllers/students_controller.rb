class StudentsController < ApplicationController
  before_action :authenticate_student!

  # skip_before_action :authenticate_student!

  def journal
    @mood = params[:mood]
    @moods = Mood.find_by(mood: @mood)
    @student_id = params[:student_id]
    @student = current_student
    #current_student.moods.create(mood: params[:mood])

    if @student.present? && @moods.present?
      if !@student.student_moods.exists?(mood_id: @moods.id)
        @student.student_moods.create(student_id: @student.id, mood_id: @moods.id)
      else
        @student.student_moods
      end
    else
      render "journal" # Render the journal page again if student or mood is missing
    end
  end

  def moods
    @student = current_student
    if @student.nil?
      render "moods"
    end
  end

  def activities
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :email, :password, :classroom_id)
  end
end
