require 'test_helper'
require 'ostruct'

class UserDummy
  attr_accessor :first_name, :last_name, :student_users
  def save ; end
end

describe Teacher do
  let(:user) { UserDummy.new }
  let(:student) { Student.new(UserDummy.new) }
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
end