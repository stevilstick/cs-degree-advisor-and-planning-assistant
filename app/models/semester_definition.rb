class SemesterDefinition < ActiveRecord::Base
  has_many :semesters
  validates :name, presence: true
  validates :in_year_position, presence: true
end
