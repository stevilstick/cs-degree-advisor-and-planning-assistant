class CreateSemesterDefinitions < ActiveRecord::Migration
  def change
    create_table :semester_definitions do |t|
      t.string :name
      t.integer :inYearPosition

      t.timestamps null: false
    end
  end
end
