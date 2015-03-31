class Year < ActiveRecord::Base
  validates :semesters, :length => {:maximum => 3}
  belongs_to :course_plan
  has_many :semesters
end
