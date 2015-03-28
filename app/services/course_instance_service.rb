class CourseInstanceService
  def find(context)
      return CourseInstance.where(:semester_id => context[:semester_id])
  end
  
end