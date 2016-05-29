require "test_helper"

describe TeachersController do
  describe "GET index" do
    before do
      get :index
    end

    it "renders teachers/index" do
      must_render_template "teachers/index"
    end

    it "responds with success" do
      must_respond_with :success
    end
  end
  describe "GET show" do
    before do
      @it = User.create(first_name: "first", last_name: "last", is_teacher: true)
      @student = User.create(first_name: "Stuart", last_name: "Dent", is_teacher: false)
    end

    it "renders teachers/unknown for unknown user" do
      get :show, {id: @it.id + 1000}
      must_render_template "teachers/unknown"
    end

    it "responds with 404 for unknown user" do
      get :show, {id: @it.id + 1000}
      must_respond_with 404
    end

    it "renders teachers/show for known teacher" do
      get :show, {id: @it.id}
      must_render_template "teachers/show"
    end

    it "responds with success for known user" do
      get :show, {id: @it.id}
      must_respond_with :success
    end

    it "renders teachers/unknown for student user" do
      get :show, {id: @student.id}
      must_render_template "teachers/unknown"
    end
  end
end
