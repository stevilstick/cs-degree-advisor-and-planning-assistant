class Student < ActiveRecord::Base
  belongs_to :user
  has_one :degree
end
