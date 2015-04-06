class Course < ActiveRecord::Base
  has_many :course_instances
  has_one :degree_requirement
  has_many :prerequisites

  # For fuzzy searching, names do not have to be exact

  fuzzily_searchable :course_listing, :name, :subject 
  
  def course_listing
    "#{subject} #{call_number}" 
  end

  def course_listing_changed?
    subject_changed? || call_number_changed?
  end

  # We can do a strict search by querying on a given field as well
  def self.search(field, query)
    where("#{field} like ?", "%#{query}%") 
  end
end
