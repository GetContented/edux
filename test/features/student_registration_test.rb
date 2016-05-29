require 'test_helper'

feature "Student Registration" do
  scenario "the main page has a link to the students section" do
    visit root_path
    page.must_have_link "Students"
  end
  scenario "students section has registration link" do
    visit students_path
    page.must_have_link "Register"
  end
  scenario "student registration page accepts input" do
    visit new_student_path
    fill_in "first_name", with: "First"
    fill_in "last_name", with: "Last"
    click_on "Register"
    page.must_have_content "First Last"
  end
end