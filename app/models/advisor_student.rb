class AdvisorStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :advisor
end
