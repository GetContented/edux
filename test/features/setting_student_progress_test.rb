require 'test_helper'

feature "Setting Student Progress" do
  before do
    user = User.create(first_name: "Stuart", last_name: "Dent")
    user.extend Student
    user.create_student_record(lesson: 1, part: 1)
    @it = user
  end
  scenario "visiting the show page for a non-existing student shows an 'unknown student' message" do
    visit student_path("None")
    page.must_have_content "Unknown Student"
  end
  scenario "visiting the show page for an existing student succeeds" do
    visit student_path(@it)
    page.must_have_content @it.first_name
    page.must_have_content @it.last_name
  end
  scenario "visiting 'update student progress' page for a non-existing student shows an 'unknown student' message" do
    visit edit_student_path("None")
    page.must_have_content "Unknown Student"
  end
  scenario "visiting 'update student progress' page for an existing student succeeds" do
    visit edit_student_path(@it)
    page.must_have_content @it.full_name
  end
  scenario "updating the student progress succeeds" do
    visit edit_student_path(@it)
    select "L1", from: "progress_lesson"
    select "P2", from: "progress_part"
    click_on "Update"
    page.must_have_content "L1 P2"
  end
  scenario "updating the student progress beyond the next step fails" do
    visit edit_student_path(@it)
    @it.student_record.update_attributes(lesson: 1, part: 1)
    select "L1", from: "progress_lesson"
    select "P3", from: "progress_part"
    click_on "Update"
    page.must_have_content "L1 P1"
    page.must_have_content "You can only proceed to the next part."
  end
end