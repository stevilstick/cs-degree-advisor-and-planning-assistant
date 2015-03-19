class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.references :course_plan, index: true
      t.integer :year

      t.timestamps
    end
  end
end
