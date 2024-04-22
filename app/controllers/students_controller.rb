class StudentsController < ApplicationController

  skip_before_action :authenticate_student!

  def journal
  end

  def moods
  end

  def activities

  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :email, :password, :classroom_id)
  end

end
