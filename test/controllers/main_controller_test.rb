require 'test_helper'

describe "MainController" do
  describe "GET index" do
    before do
      get :index
    end

    it "renders main/index" do
      must_render_template "main/index"
    end

    it "responds with success" do
      must_respond_with :success
    end
  end
end