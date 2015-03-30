class CoursePlan < ActiveRecord::Base
  belongs_to :student
  has_many :years
  validates :student_id, presence: true
end
