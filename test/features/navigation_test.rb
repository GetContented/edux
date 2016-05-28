require 'test_helper'

feature "Navigation" do
  scenario "the main page renders without error" do
    visit root_path
    page.must_have_content "Welcome to EduX"
  end
end