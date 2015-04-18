json.semester do
  json.id               @semester.id
  json.created_at       @semester.created_at
  json.year_id          @semester.year_id
  json.semester_definition_id             @semester.semester_definition_id
end
