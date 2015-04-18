class Semester < ActiveRecord::Base
  belongs_to :year
  has_many :course_instances, dependent: :destroy
  has_one :semester_definition
  validates_associated :year
  validates_presence_of :year
end
