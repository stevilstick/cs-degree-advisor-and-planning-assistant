class RemoveSemesterDefinitionsIdFromSemester < ActiveRecord::Migration
  def change
    remove_column :semesters, :semester_definitions_id
  end
end
