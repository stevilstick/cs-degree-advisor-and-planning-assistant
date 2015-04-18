class AddMaxCreditHoursToSemesterDefinitions < ActiveRecord::Migration
  def change
    add_column :semester_definitions, :max_credit_hours, :decimal, precision:10, scale:2
  end
end
