class StudentsController < ApplicationController


  # skip_before_action :authenticate_student!
  skip_before_action :authenticate_student!
  
  def journal
    @mood = params[:mood]
    @student_id = params[:student_id]

    current_student.moods.create(mood: params[:mood])
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
