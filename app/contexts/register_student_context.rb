class RegisterStudentContext
  attr_reader :student

  def self.call(user)
    RegisterStudentContext.new(user).call
  end

  def initialize(user)
    @student = Student.new(user)
  end

  def call
    student.register!
  end
end