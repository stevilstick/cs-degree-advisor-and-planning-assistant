class CourseInstanceService

  # Find course instances for a given context
  # Context must be in the format: {semester_id: 1}
  def find(context)
      return CourseInstance.where(:semester_id => context[:semester_id])
  end

  # Find course instances for a given context
  # Context must be in the format: {year_id: 1}
  def find_by_year(context)
    semesters_in_year = Semester.where(:year_id => context[:year_id])
    course_instances = Array.new
    semesters_in_year.each do |s|
      course_instances_in_s = find({semester_id: s.id})
      if !course_instances_in_s.empty?
        course_instances.push(course_instances_in_s)
      end
    end
    return course_instances
  end

end