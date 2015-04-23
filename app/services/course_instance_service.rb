class CourseInstanceService

  # Find course instances for a given context
  # Context must be in the format: {semester_id: 1}
  def self.find(context)
      semester = Semester.find(context[:semester_id])
      return semester.course_instances
  end

  # Find course instances for a given context
  # Context must be in the format: {year_id: 1}
  def self.find_by_year(context)
    year = Year.find(context[:year_id])
    semesters_in_year = year.semesters
    course_instances = Array.new
    semesters_in_year.each do |s|
      course_instances_in_s = find({semester_id: s.id})
      if !course_instances_in_s.empty?
        course_instances.concat(course_instances_in_s)
      end
    end
    return course_instances
  end

  # Find course instances added to previous years
  # Parameter is a context with the year_id
  # Context must be in the format: {year_id: 1}
  def self.find_before_year(context)
    course_instances = Array.new
    year = Year.find(context[:year_id])
    years = year.course_plan.years
    years.each do |y|
      if y.year < year.year
        course_instances_in_s = find_by_year({year_id: y.id})
        if !course_instances_in_s.empty?
          course_instances.concat(course_instances_in_s)
        end
      end
    end
    return course_instances
  end

  # Find course instances added to previous semesters in year
  # Parameter is a context with the semester_id
  # Context must be in the format: {semester_id: 1}
  def self.find_before_semester(context)
    course_instances = Array.new
    all_past_semesters = SemesterService.find_past_semesters(context)
    all_past_semesters.each do |s|
      course_instances_in_s = find({semester_id: s.id})
      if !course_instances_in_s.empty?
        course_instances.concat(course_instances_in_s)
      end
    end
    return course_instances
  end

  # Find all course instances added to previous semesters in this course plan
  # Parameter is a context with the semester_id
  # Context must be in the format: {semester_id: 1}
  def self.find_all_before_semester(context)
    semester = Semester.find(context[:semester_id])
    year = semester.year
    course_instances = Array.new
    course_instances.concat(find_before_year({year_id: year.id}))
    course_instances.concat(find_before_semester(context))
    return course_instances
  end

  # Gets all the course instances
  # Context must be in the format: {course_id: 1}
  def self.find_all_in_plan(context)
    course_plan = CoursePlan.find(context[:course_plan_id])
    years = course_plan.years
    course_instances = Array.new
    years.each do |y|
      course_instances.concat(find_by_year({year_id: y.id}))
    end
    return course_instances
  end

  # Find all course instances added to previous semesters in this course plan
  # Parameter is a context with the course_plan_id
  # Context must be in the format: {course_plan_id: 1}
  def self.updatePrerequisites(context)
    find_all_in_plan(context).each do |c_i|
      if PrerequisiteService.hasCompletedPrerequisites({course_instance_id: c_i.id})
        CourseInstance.update(c_i.id, prerequisites: 1)
      else
        CourseInstance.update(c_i.id, prerequisites: 0)
      end
    end
  end

end