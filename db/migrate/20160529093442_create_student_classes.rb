class CreateStudentClasses < ActiveRecord::Migration
  def change
    create_table :student_classes do |t|
      t.string :name
      t.integer :teacher_user_id

      t.timestamps null: false
    end
  end
end
