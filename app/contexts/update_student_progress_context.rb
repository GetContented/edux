class UpdateStudentProgressContext
  attr_reader :student, :progress

  def self.call(user, progress)
    UpdateStudentProgressContext.new(user, progress).call
  end

  def initialize(user, progress)
    @student = user.extend Student
    @progress = progress
  end

  def call
    current_lesson_and_part = [@student.progress_lesson.to_i, @student.progress_part.to_i]
    next_lesson_and_part = [progress.lesson.to_i, progress.part.to_i]
    if Lesson.next?(current_lesson_and_part, next_lesson_and_part)
      @student.update_progress(progress)
      [@student, :success]
    else
      [@student, :failure]
    end
  end
end