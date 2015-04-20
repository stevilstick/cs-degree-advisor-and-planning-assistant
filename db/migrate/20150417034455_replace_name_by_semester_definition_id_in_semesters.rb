class ReplaceNameBySemesterDefinitionIdInSemesters < ActiveRecord::Migration
  def change
  	remove_column :semesters, :name, :string
    add_reference :semesters, :semester_definitions, index: true
  end
end
