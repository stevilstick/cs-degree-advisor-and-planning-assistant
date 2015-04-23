class AddSemesterDefinitionToSemester < ActiveRecord::Migration
  def change
    add_reference :semesters, :semester_definitions, index: true
    add_foreign_key :semesters, :semester_definitions
  end
end
