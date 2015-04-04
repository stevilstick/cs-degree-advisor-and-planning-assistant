class AddCrnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :crn, :integer
  end
end
