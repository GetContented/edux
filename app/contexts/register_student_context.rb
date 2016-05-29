class RegisterStudentContext
  attr_reader :student

  def self.call(user)
    RegisterStudentContext.new(user).call
  end

  def initialize(user)
    student_record = user.build_student_record
    @student = Student.new(user, student_record)
  end

  def call
    @student.register!
    @student
  end
end