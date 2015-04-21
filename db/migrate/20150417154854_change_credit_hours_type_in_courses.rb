class ChangeCreditHoursTypeInCourses < ActiveRecord::Migration
  def change
      change_column :courses, :credit_hours, :decimal, precision:10, scale:2
  end
end
