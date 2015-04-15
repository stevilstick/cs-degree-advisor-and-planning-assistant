json.course do
  json.id               @course.id
  json.created_at       @course.created_at
  json.subject          @course.subject
  json.call_number      @course.call_number
  json.credit_hours     @course.credit_hours
  json.description      @course.description
  json.name             @course.name
end
