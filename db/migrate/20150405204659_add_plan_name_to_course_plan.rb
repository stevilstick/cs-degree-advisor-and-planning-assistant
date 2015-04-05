class AddPlanNameToCoursePlan < ActiveRecord::Migration
  def change
    add_column :course_plans, :plan_name, :string
  end
end
