require 'test_helper'
require 'ostruct'

class UserDummy
  attr_accessor :first_name, :last_name, :student_classes
  def initialize
    @student_classes = []
  end
  def save ; end
end

class StudentClassDummy
  attr_accessor :student_users
  def initialize
    @student_users = []
  end
end

describe Teacher do
  let(:user) { UserDummy.new }
  let(:student) { UserDummy.new.extend(Student) }
  let(:student_class) { StudentClassDummy.new }
  subject { user.extend Teacher }

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

  it "can respond with a full name" do
    subject.first_name = "George"
    subject.last_name = "Smith"
    subject.full_name.must_equal "George Smith"
  end

  it "can add a student class" do
    subject.add_student_class(student_class)
    subject.student_classes.must_include student_class
  end

  it "can add a student to a class" do
    subject.add_student_class(student_class)
    subject.add_student_to_class(student, student_class)
    student_class.student_users.must_include student
  end
end