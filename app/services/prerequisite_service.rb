class PrerequisiteService

  # Returns an array with the courses required by a course with id
  # P.S this is a 'static' method, should be called PrerequisiteService.getPrerequisites context
  # Context must be in the format: {course_id: course.id}
  def self.getPrerequisites(context)
    reqs = Prerequisite.where(:this_course_id => context[:course_id])
    req_ids = Array.new
    reqs.each do |r|
      # this only should only contain those prereqs of type 1
      # to know what the types mean read data model description
      if r.prerequisite_type == 1 #default value for type is 1
        req_ids.insert(-1, r.target_course_id) #adding id of required course to the end of array
      end
    end
    return Course.find(req_ids)
  end

  # Returns an array with the courses for which the course with course id is required
  # P.S this is a 'static' method, should be called PrerequisiteService.getPrerequisites context
  # Context must be in the format: {course_id: course.id}
  def self.isRequiredFor(context)
    reqs = Prerequisite.where(:target_course_id => context[:course_id])
    req_ids = Array.new
    reqs.each do |r|
      req_ids.insert(-1, r.this_course_id) #adding id of required course to the end of array
    end
    return Course.find(req_ids)
  end

  # Returns an array with the Courses that need to be completed for this course instance
  # Context must be in the format: {course_instance_id: course_instance.id}
  def self.needToBeCompleted(context)
    c_instance = CourseInstance.where(:id => context[:course_instance_id])[0]
    prereqs = getPrerequisites({course_id: c_instance.course_id})
    all_past_instances = CourseInstanceService.find_all_before_semester({semester_id: c_instance.semester_id})
    incomplete = prereqs
    all_past_instances.each do |c_i|
      prereqs.each do |p|
        if c_i.course_id == p.id
          incomplete.delete(p)
          if incomplete.length == 0
            return incomplete
          end
        end
      end
    end
      return incomplete
  end

  # Check whether a course has its prerequisites added to a past semester
  # Context must be in the format: {course_instance_id: course_instance.id}
  def self.hasCompletedPrerequisites(context)
    #this only handles type 1 prerequisites
    return needToBeCompleted(context).empty?
  end

end