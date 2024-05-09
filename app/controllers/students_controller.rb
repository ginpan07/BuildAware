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
      @check_student_mood_mood = @student.student_moods.find_by(mood_id: @moods.id)

      if @check_student_mood_mood.nil?
        @new_mood = @student.student_moods.new(student_id: @student.id, mood_id: @moods.id)
        @new_mood.save
      else
        @student.student_moods.last.update(mood_id: @moods.id)
        # @check_student_mood_mood.update(mood_id: @moods.id)
        # @check_student_mood_mood.save
      end

      # Reorder the moods so that the updated mood is placed at the end
      # @student.student_moods.reload.order(created_at: :asc).each_with_index do |student_mood, index|
      #   student_mood.update(created_at: Time.now + index.seconds)
      # end
      #do it in the classroom_detail.html.erb

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

  def create
  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :email, :password, :classroom_id, :mood)
  end
end
