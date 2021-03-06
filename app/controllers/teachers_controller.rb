class TeachersController < ApplicationController
  def index
  end
  def show
    user = User.where(id: params[:id], is_teacher: true).first
    if(user)
      @teacher = user.extend Teacher
    else
      respond_to do |format|
        format.html { render template: "teachers/unknown", status: 404 }
        format.json { render json: { error: "Unknown Teacher" }.to_json, status: 404}
      end
    end
  end
end
