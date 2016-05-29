module Student
  def model_name
    ActiveModel::Name.new(Student)
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  def progress
    "L#{progress_lesson} P#{progress_part}"
  end
  def progress_lesson
    student_record.lesson
  end

  def progress_lesson=(new_lesson)
    student_record.lesson = new_lesson
  end

  def progress_part
    student_record.part
  end

  def progress_part=(new_part)
    student_record.part = new_part
  end
  def register!
    save
    self.progress_lesson = 1
    self.progress_part = 1
    student_record.save
  end
  def update_progress(progress)
    self.progress_lesson = progress.lesson
    self.progress_part = progress.part
    student_record.save
  end
end
