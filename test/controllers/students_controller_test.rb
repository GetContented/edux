require "test_helper"

describe StudentsController do
  describe "GET index" do
    before do
      get :index
    end

    it "renders students/index" do
      must_render_template "students/index"
    end

    it "responds with success" do
      must_respond_with :success
    end
  end
  describe "GET new" do
    before do
      get :new
    end

    it "renders students/new" do
      must_render_template "students/new"
    end

    it "responds with success" do
      must_respond_with :success
    end
  end
  describe "POST create" do
    it "creates a new user" do
      assert_difference('User.count') do
        post :create, student: {first_name: "first", last_name: "last"}
      end
    end
  end
  describe "GET show" do
    before do
      @it = User.create(first_name: "first", last_name: "last")
      @it.create_student_record
    end

    it "renders students/unknown for unknown user" do
      get :show, {id: @it.id + 1000}
      must_render_template "students/unknown"
    end

    it "responds with 404 for unknown user" do
      get :show, {id: @it.id + 1000}
      must_respond_with 404
    end

    it "renders students/show for known user" do
      get :show, {id: @it.id}
      must_render_template "students/show"
    end

    it "responds with success for known user" do
      get :show, {id: @it.id}
      must_respond_with :success
    end

    describe "with JSON" do
      it "responds with success for known user" do
        get :show, {id: @it.id, format: :json}
        must_respond_with :success
      end

      it "responds with 404 for unknown user" do
        get :show, {id: @it.id + 1000, format: :json}
        must_respond_with 404
      end

      it "has student's name and progress for known user" do
        @it = User.create(first_name: "first", last_name: "last")
        @it.create_student_record(lesson: 5, part: 2)
        get :show, {id: @it.id, format: :json}
        response.body.must_include "first last"
        response.body.must_include "L5 P2"
      end
    end
  end
  describe "GET edit" do
    before do
      @it = User.create(first_name: "first", last_name: "last")
      @it.create_student_record
    end

    it "renders students/edit for known user" do
      get :edit, {id: @it.id}
      must_render_template "students/edit"
    end

    it "renders students/unknown for unknown user" do
      get :edit, {id: @it.id + 1000}
      must_render_template "students/unknown"
    end
  end
  describe "PUT update" do
    before do
      @it = User.create(first_name: "first", last_name: "last")
      @it.create_student_record
    end

    it "updates a known user" do
      patch :update, id: @it.id, student: {progress_lesson: 1, progress_part: 2}
      must_redirect_to student_url(@it)
    end

    it "renders students/unknown for unknown user" do
      patch :update, id: @it.id + 1000, student: {progress_lesson: 1, progress_part: 2}
      must_render_template "students/unknown"
    end
  end
end
