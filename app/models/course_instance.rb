class CourseInstance < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  belongs_to :student
  has_one :rotation
end
