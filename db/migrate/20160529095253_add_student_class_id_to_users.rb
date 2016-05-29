class AddStudentClassIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student_class_id, :integer
  end
end
