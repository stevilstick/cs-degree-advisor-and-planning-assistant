class RemoveSemesterDefinitionsIdFromSemester < ActiveRecord::Migration
  def change
    remove_column :semesters, :semester_definition_id
  end
end
