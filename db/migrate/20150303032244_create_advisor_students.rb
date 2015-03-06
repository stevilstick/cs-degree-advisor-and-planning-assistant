class CreateAdvisorStudents < ActiveRecord::Migration
  def change
    create_table :advisor_students do |t|
      t.references :student, index: true
      t.references :advisor, index: true

      t.timestamps
    end
  end
end
