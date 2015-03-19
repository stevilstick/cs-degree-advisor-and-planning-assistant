class Year < ActiveRecord::Base
  belongs_to :course_plan
  has_many :semester
  validates :year, uniqueness: { :scope => [:year, :course_plan_id], message: "Cannot add the same year twice" }
  #validates :course_plan_id, presence: true
end
