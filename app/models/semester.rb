class Semester < ActiveRecord::Base
  belongs_to :year
  has_many :course_instances
end
