class Prerequisite < ActiveRecord::Base
  belongs_to :course
  validates :this_course_id, presence: true
  validates :target_course_id, presence: true
end
