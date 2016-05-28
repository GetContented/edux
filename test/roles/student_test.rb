require 'test_helper'
require 'ostruct'

class DummyClass
  attr_accessor :first_name, :last_name
end

describe Student do
  let(:actor) {
    DummyClass.new
  }
  subject { Student.new(actor) }

  it "can be instantiated" do
    subject.wont_be_nil
  end

  it "delegates getting first name" do
    actor.first_name = "George"
    subject.first_name.must_equal "George"
  end

  it "delegates setting first name" do
    subject.first_name = "George"
    actor.first_name.must_equal "George"
  end

  it "delegates getting last name" do
    actor.last_name = "Smith"
    subject.last_name.must_equal "Smith"
  end

  it "delegates setting last name" do
    subject.last_name = "Smith"
    actor.last_name.must_equal "Smith"
  end

  it "can register itself" do
    user = MiniTest::Mock.new
    user.expect :save, nil, []
    student = Student.new(user)
    student.register!
  end
end