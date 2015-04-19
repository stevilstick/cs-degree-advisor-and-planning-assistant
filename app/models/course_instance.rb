class CourseInstance < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  belongs_to :student
  has_one :rotation
  validates :course_id, uniqueness: { :scope => :semester, message: "Cannot add the same course twice in a semester" }

  def to_s
    "Course ID:#{self.course_id} Semester ID:#{self.semester_id} Student_ID: #{self.student_id} Rotation ID:#{self.rotation_id}"
 end
  
  def get_semester_id
    return semester_id
  end
end
