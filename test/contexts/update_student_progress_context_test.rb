require 'test_helper'
require 'ostruct'

describe UpdateStudentProgressContext do
  let(:user) { OpenStruct.new(student_record: OpenStruct.new(lesson: 1, part: 1)) }
  let(:success_progress) { OpenStruct.new(lesson: 1, part: 2) }
  let(:failure_progress) { OpenStruct.new(lesson:5, part: 1) }
  subject { UpdateStudentProgressContext.new(user, success_progress) }

  it "can be instantiated" do
    subject.wont_be_nil
  end

  it "can be called" do
    subject.call
  end

  it "returns a student and successful status" do
    student, status = subject.call
    student.must_equal user
    status.must_equal :success
  end

  it "returns a student and failure status when progress incorrect" do
    subject = UpdateStudentProgressContext.new(user, failure_progress)
    _, status = subject.call
    status.must_equal :failure
  end
end