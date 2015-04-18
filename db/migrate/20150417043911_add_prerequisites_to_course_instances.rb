class AddPrerequisitesToCourseInstances < ActiveRecord::Migration
  def change
    add_column :course_instances, :prerequisites, :integer
  end
end
