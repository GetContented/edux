require 'test_helper'
require 'ostruct'

describe RegisterStudentContext do
  let(:user) { OpenStruct.new }
  subject { RegisterStudentContext.new(user) }

  it "can be instantiated" do
    subject.wont_be_nil
  end

  it "can be called" do
    subject.call
  end
end