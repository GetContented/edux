class StudentsController < ApplicationController
  def index
  end

  def new
    @student = User.new().extend Student
  end

  def create
    user = User.new(params[:student].permit(:first_name, :last_name))
    @student = RegisterStudentContext.call(user)

    redirect_to student_url(@student)
  end

  def update
    user = User.find_by_id(params[:id])
    if(user)
      progress = OpenStruct.new(lesson: params[:student][:progress_lesson], part: params[:student][:progress_part])
      @student = UpdateStudentProgressContext.call(user, progress)
      redirect_to student_url(@student)
    else
      render template: "students/unknown"
    end
  end

  def show
    set_student_or_render_unknown
  end

  def edit
    set_student_or_render_unknown
  end

  private

  def set_student_or_render_unknown
    user = User.where(id: params[:id], is_teacher: false).first
    if(user)
      @student = user.extend Student
    else
      respond_to do |format|
        format.html { render template: "students/unknown", status: 404 }
        format.json { render json: { error: "Unknown Student" }.to_json, status: 404}
      end
    end
  end
end
