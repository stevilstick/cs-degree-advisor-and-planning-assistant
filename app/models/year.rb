class Year < ActiveRecord::Base
  belongs_to :course_plan
  has_many :semesters
end
