class CreateDegreeRequirements < ActiveRecord::Migration
  def change
    create_table :degree_requirements do |t|
      t.references :course, index: true
      t.references :degree, index: true

      t.timestamps null: false
    end
    add_foreign_key :degree_requirements, :courses
    add_foreign_key :degree_requirements, :degrees
  end
end
