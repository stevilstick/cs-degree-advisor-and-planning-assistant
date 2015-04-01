class Semester < ActiveRecord::Base
  belongs_to :year
  has_many :course_instances
  validates_associated :year
  validates_presence_of :year
end
