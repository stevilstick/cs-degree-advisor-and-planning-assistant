class Course < ActiveRecord::Base
  has_many :course_instances
  has_one :degree_requirement
  has_many :prerequisites
  validates :name, uniqueness: true # Cannot add the same course twice
end
