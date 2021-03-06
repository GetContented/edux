require 'test_helper'
require 'ostruct'

class UserDummy
  attr_accessor :first_name, :last_name, :student_record
  def save ; end
end

class StudentRecordDummy
  attr_accessor :lesson, :part
  def save ; end
end

describe Student do
  let(:user) do
    u = UserDummy.new
    u.student_record = student_record
    u
  end
  let(:student_record) { StudentRecordDummy.new }
  subject { user.extend Student }

  it "can be instantiated" do
    subject.wont_be_nil
  end

  it "delegates getting first name" do
    user.first_name = "George"
    subject.first_name.must_equal "George"
  end

  it "delegates setting first name" do
    subject.first_name = "George"
    user.first_name.must_equal "George"
  end

  it "delegates getting last name" do
    user.last_name = "Smith"
    subject.last_name.must_equal "Smith"
  end

  it "delegates setting last name" do
    subject.last_name = "Smith"
    user.last_name.must_equal "Smith"
  end

  it "can register itself" do
    student = user.extend Student
    student.register!
  end

  it "can respond with a full name" do
    subject.first_name = "George"
    subject.last_name = "Smith"
    subject.full_name.must_equal "George Smith"
  end

  it "can respond with progress" do
    subject.progress_lesson = 2
    subject.progress_part = 2
    subject.progress.must_equal "L2 P2"
  end

  it "can update its progress" do
    progress = OpenStruct.new(lesson: 3, part: 3)
    subject.update_progress(progress)
    subject.progress.must_equal "L3 P3"
  end
end