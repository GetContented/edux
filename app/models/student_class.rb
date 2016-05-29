class StudentClass < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_user_id'
  has_many :student_users, class_name: 'User', foreign_key: 'student_class_id'

  def students
    self.student_users.map{ |u| u.extend(Student) }
  end
end
