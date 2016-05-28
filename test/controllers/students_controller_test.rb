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
        post :create, user: {first_name: "first", last_name: "last"}
      end
    end
  end
end
