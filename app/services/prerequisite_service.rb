class PrerequisiteService

  # Returns an array with the courses required by a course with id
  # P.S this is a 'static' method, should be called PrerequisiteService.getPrerequisites context
  # Context most be in the format: {course_id: course.id}
  def self.getPrerequisites(context)
    reqs = Prerequisite.where(:this_course_id => context[:course_id])
    req_ids = Array.new
    reqs.each do |r|
      req_ids.insert(-1, r.target_course_id) #adding id of required course to the end of array
    end
    return Course.find(req_ids)
  end 
  
end