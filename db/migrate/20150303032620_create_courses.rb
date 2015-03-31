class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :subject
      t.integer :call_number
      t.integer :credit_hours
      t.string :description

      t.timestamps
    end
  end
end
