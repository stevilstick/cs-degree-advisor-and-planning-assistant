class CreateSemesterDefinitions < ActiveRecord::Migration
  def change
    create_table :semester_definitions do |t|
      t.string :name
      t.integer :in_year_position
      t.timestamps null: false
    end
  end
end
