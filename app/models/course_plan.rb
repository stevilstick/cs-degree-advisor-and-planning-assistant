class CoursePlan < ActiveRecord::Base
  belongs_to :student
  has_many :years, -> {order "year ASC"}, dependent: :destroy
  validates :plan_name, presence: true
end
