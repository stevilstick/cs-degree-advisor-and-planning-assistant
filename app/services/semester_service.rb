class SemesterService
  # Finds all semesters that are positioned before this semester in the year that this semester belongs to.
  # context {semester_id: 1}
  def self.find_past_semesters(context)
    previous_semesters = Array.new
    semester = Semester.where(:id => context[:semester_id])
    position = SemesterDefinition.where(:id => semester[0].semester_definitions_id)[0].in_year_position
    semester_in_year = semester[0].year.semesters
    semester_in_year.each do |s|
      sem_def = SemesterDefinition.where(:id => s.semester_definitions_id)[0]
      if sem_def.in_year_position < position
       previous_semesters.push(s)
      end
    end
    return previous_semesters
  end
end