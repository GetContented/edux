require "test_helper"

describe StudentClass do
  let(:student_class) { StudentClass.new }

  it "must be valid" do
    value(student_class).must_be :valid?
  end
end
