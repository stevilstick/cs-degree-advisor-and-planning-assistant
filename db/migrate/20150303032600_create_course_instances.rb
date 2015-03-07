class CreateCourseInstances < ActiveRecord::Migration
  def change
    create_table :course_instances do |t|
      t.references :course, index: true
      t.references :semester, index: true
      t.references :student, index: true
      t.references :rotation, index: true

      t.timestamps
    end
  end
end
