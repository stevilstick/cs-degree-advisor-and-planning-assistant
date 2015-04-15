class Year < ActiveRecord::Base
  belongs_to :course_plan
  has_many :semesters, dependent: :destroy
  validates :year, uniqueness: { :scope => [:year, :course_plan_id], message: "Cannot add the same year twice" }
  validates :course_plan_id, presence: true

  after_create :add_semesters

  def add_semesters
    defaults = Rails.configuration.years[:default_semesters]
    semesters = []
    defaults.each do |sem|
      semesters << {name:sem}
    end
    self.semesters.create(semesters)
  end
end
