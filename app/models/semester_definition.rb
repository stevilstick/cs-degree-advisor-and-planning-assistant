class SemesterDefinition < ActiveRecord::Base
  belongs_to :semester
  validates :name, presence: true
  validates :in_year_position, presence: true
end
