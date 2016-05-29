require 'test_helper'

feature "Teacher Report" do
  let(:student) { User.create(first_name: "Stuart", last_name: "Dent").extend Student }
  before do
    user = User.create(first_name: "Tina", last_name: "Cher", is_teacher: true)
    @it = user.extend Teacher
    @student_class = @it.student_classes.create(name: "Class A1")
  end
  scenario "visiting the report page for a non-existing teacher shows an 'unknown teacher' message" do
    visit teacher_path("None")
    page.must_have_content "Unknown Teacher"
  end
  scenario "visiting the report page for the id of a student shows an 'unknown teacher' message" do
    visit teacher_path(student)
    page.must_have_content "Unknown Teacher"
  end
  scenario "visiting the report page for a teacher shows the information for that teacher" do
    visit teacher_path(@it)
    page.must_have_content "Tina Cher"
  end
  scenario "visiting the report page for a teacher shows the student classes of that teacher" do
    visit teacher_path(@it)
    page.must_have_content "Class A1"
  end
  scenario "visiting the report page for a teacher shows the information for that teacher's students" do
    students = (1..3).map{|n| User.create(first_name: "First #{n}", last_name: "Last #{n}").extend(Student)}
    @it.add_student_to_class(students.first, @student_class)
    @it.add_student_to_class(students.last, @student_class)
    visit teacher_path(@it)
    page.must_have_content "First 1 Last 1"
    page.wont_have_content "First 2 Last 2"
    page.must_have_content "First 3 Last 3"
  end
end