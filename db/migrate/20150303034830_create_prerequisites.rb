class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|

      t.references :this_course, index: true
      t.references :target_course, index: true

      t.timestamps
    end
  end
end
