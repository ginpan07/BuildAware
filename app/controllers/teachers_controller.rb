class TeachersController < ApplicationController
    before_action :authenticate_teacher!

    def main_page
        @teacher = current_teacher
        @classrooms = @teacher.classrooms
    end

    def classroom_details

    end

end
