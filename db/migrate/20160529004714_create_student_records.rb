class CreateStudentRecords < ActiveRecord::Migration
  def change
    create_table :student_records do |t|
      t.integer :user_id
      t.integer :lesson
      t.integer :part

      t.timestamps null: false
    end
  end
end
