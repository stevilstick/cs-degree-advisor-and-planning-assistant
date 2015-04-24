class AddSemesterDefinitionToSemester < ActiveRecord::Migration
  def change
    add_reference :semesters, :semester_definition, index: true
    add_foreign_key :semesters, :semester_definition
  end
end
