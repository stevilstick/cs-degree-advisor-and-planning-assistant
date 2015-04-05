class Course < ActiveRecord::Base
  has_many :course_instances
  has_one :degree_requirement
  has_many :prerequisites
  validates :course, uniqueness: { :scope => [:call_number], message: "Cannot add the same course twice" }
end
