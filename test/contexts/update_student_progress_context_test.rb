require 'test_helper'
require 'ostruct'

describe UpdateStudentProgressContext do
  let(:user) { OpenStruct.new(student_record: OpenStruct.new) }
  let(:progress) { OpenStruct.new }
  subject { UpdateStudentProgressContext.new(user, progress) }

  it "can be instantiated" do
    subject.wont_be_nil
  end

  it "can be called" do
    subject.call
  end
end