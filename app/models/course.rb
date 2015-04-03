class Course < ActiveRecord::Base
  has_many :course_instances
  has_one :degree_requirement
  has_many :prerequisites

  def self.search(query)
    where("name like ?", "%#{query}")
  end
end
