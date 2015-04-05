class Course < ActiveRecord::Base
  has_many :course_instances
  has_one :degree_requirement
  has_many :prerequisites
  validates :name, uniqueness: true # Cannot add the same course twice
  validates :name, presence: true
  validates :subject, presence: true, length: {maximum: 2}
  validates :call_number, presence: true, numericality: { only_integer: true }
  validates :credit_hours, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end
