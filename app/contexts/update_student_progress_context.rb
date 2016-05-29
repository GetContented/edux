class UpdateStudentProgressContext
  attr_reader :student, :progress

  def self.call(user, progress)
    UpdateStudentProgressContext.new(user, progress).call
  end

  def initialize(user, progress)
    @student = Student.new(user)
    @progress = progress
  end

  def call
    @student.update_progress(progress)
    @student
  end
end