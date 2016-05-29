class User < ActiveRecord::Base
  has_one :student_record, dependent: :delete
  has_many :student_classes, foreign_key: 'teacher_user_id' # for when this is a teacher
  belongs_to :student_class, foreign_key: 'student_class_id' # for when this is a student
end
