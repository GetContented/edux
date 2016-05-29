class User < ActiveRecord::Base
  has_one :student_record, dependent: :delete
end
