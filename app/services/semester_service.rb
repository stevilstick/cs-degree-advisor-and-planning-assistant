class SemesterService
  # Finds all semesters that are positioned before this semester in the year that this semester belongs to.
  # context {semester_id: 1}
  def self.find_past_semesters(context)
    previous_semesters = Array.new
    semester = Semester.find(context[:semester_id])

    position = semester.semester_definition.in_year_position
    semester_in_year = semester.year.semesters
    semester_in_year.each do |s|
      sem_def = SemesterDefinition.find(s.semester_definition_id)
      if sem_def.in_year_position < position
       previous_semesters.push(s)
      end
    end
    return previous_semesters
  end
end