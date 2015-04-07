class PrerequisiteService
  
  # Returns an array with the courses required by a course with id
  # P.S this is a 'static' method, should be called CoursesController.getPrerequisites (some integer id)
  def self.getPrerequisites(id)
    reqs = Prerequisite.where(this_course_id: id) 
    req_ids = Array.new
    reqs.each do |r|
      req_ids.insert(-1, r.target_course_id) #adding id of required course to the end of array
    end
    return Course.find(req_ids)
  end 
  
end