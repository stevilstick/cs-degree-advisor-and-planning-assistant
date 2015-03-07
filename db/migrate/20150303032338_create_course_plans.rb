class CreateCoursePlans < ActiveRecord::Migration
  def change
    create_table :course_plans do |t|
      t.references :student, index: true

      t.timestamps
    end
  end
end
