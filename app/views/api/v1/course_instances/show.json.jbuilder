json.course_instance do
  json.id               @course_instance.id
  json.created_at       @course_instance.created_at
  json.course_id        @course_instance.course_id
  json.semester_id      @course_instance.semester_id
  json.student_id       @course_instance.student_id
  json.rotation_id      @course_instance.rotation_id
end
