require 'test_helper'

feature "Teacher Report" do
  before do
    user = User.create(first_name: "Tina", last_name: "Cher")
    @it = user.extend Teacher
  end
  scenario "visiting the report page for a non-existing teacher shows an 'unknown teacher' message" do
    visit teacher_path("None")
    page.must_have_content "Unknown Teacher"
  end
  scenario "visiting the report page for a teacher shows the information for that teacher" do
    visit teacher_path(@it)
    page.must_have_content "Tina Cher"
  end
end