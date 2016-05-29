class Student
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  delegate :persisted?, to: :user_object

  attr_reader :user_object, :student_record_object

  delegate :id, :first_name, :first_name=, :last_name,
           :last_name=, to: :user_object

  def initialize(user_object, student_record_object = nil)
    @user_object = user_object
    @student_record_object = student_record_object
    if(student_record_object.nil? && @user_object.respond_to?(:student_record))
      @student_record_object = @user_object.student_record
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def register!
    @user_object.save
    self.progress_lesson = 1
    self.progress_part = 1
    @student_record_object.save
  end

  def progress
    "L#{progress_lesson} P#{progress_part}"
  end

  def progress_lesson
    @student_record_object.lesson
  end

  def progress_lesson=(new_lesson)
    @student_record_object.lesson = new_lesson
  end

  def progress_part
    @student_record_object.part
  end

  def progress_part=(new_part)
    @student_record_object.part = new_part
  end

  def update_progress(progress)
    self.progress_lesson = progress.lesson
    self.progress_part = progress.part
    @student_record_object.save
  end
end