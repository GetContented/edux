class StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new(User.new)
  end

  def create
    user = User.new(params[:user].permit(:first_name, :last_name))
    RegisterStudentContext.call(user)

    redirect_to students_url
  end
end
