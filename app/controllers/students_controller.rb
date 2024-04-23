class StudentsController < ApplicationController

  skip_before_action :authenticate_student!

  def journal
  end

  def moods
  end

  def activities

  end

  def show
  end
end
