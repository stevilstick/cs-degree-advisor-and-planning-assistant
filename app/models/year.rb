class Year < ActiveRecord::Base
  validates_length_of :semesters, :maximum => 3, :message=>'You may only add up to three semesters to a year.'
  belongs_to :course_plan
  has_many :semesters, dependent: :destroy
  validates :year, uniqueness: { :scope => [:year, :course_plan_id], message: "Cannot add the same year twice" }
  validates :course_plan_id, presence: true

  after_save :add_semesters

  def add_semesters
    self.semesters.create([{name:'Spring'},{name:'Summer'},{name:'Fall'}])
  end
end
