module Teacher
  def model_name
    ActiveModel::Name.new(Teacher)
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  def add_student_class(student_class)
    self.student_classes << student_class
  end
  def add_student_to_class(student, student_class)
    if(self.student_classes.include?(student_class) &&
       !student_class.student_users.include?(student))
      student_class.student_users << student
    end
  end
end