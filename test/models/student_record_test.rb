require "test_helper"

describe StudentRecord do
  let(:student_record) { StudentRecord.new }

  it "must be valid" do
    value(student_record).must_be :valid?
  end
end
