class CoursePlan < ActiveRecord::Base
  belongs_to :student
  has_many :year
  validates :student_id, presence: true
end
