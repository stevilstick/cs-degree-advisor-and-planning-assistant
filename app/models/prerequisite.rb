class Prerequisite < ActiveRecord::Base
  belongs_to :this_course, class_name => 'Course'
  belongs_to :target_course, class_name => 'Course'
end
