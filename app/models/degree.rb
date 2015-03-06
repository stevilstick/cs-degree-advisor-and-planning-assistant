class Degree < ActiveRecord::Base
  has_many :degree_requirements
  belongs_to :student
end
