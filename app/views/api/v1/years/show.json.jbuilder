json.year do
  json.id               @year.id
  json.created_at       @year.created_at
  json.course_plan_id   @year.course_plan_id
  json.year             @year.year
end
