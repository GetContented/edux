class RegisterStudentContext
  attr_reader :student

  def self.call(user)
    RegisterStudentContext.new(user).call
  end

  def initialize(user)
    student = user.extend Student
    student.build_student_record
    @student = student
  end

  def call
    @student.register!
    @student
  end
end