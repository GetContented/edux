json.api_version "0.0.1"
json.id @student.id
json.name @student.full_name
json.progress @student.progress
json.update_progress_url edit_student_url(@student)
json.generated_at Time.zone.now