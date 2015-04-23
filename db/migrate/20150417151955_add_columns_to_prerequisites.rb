class AddColumnsToPrerequisites < ActiveRecord::Migration
  def change
    # required_credit_hours will allow you to have 2 digits after the decimal point and 10 digits max
    add_column :prerequisites, :required_credit_hours, :decimal, precision:10, scale:2
    add_column :prerequisites, :prerequisite_type, :integer, default: 1
    add_column :prerequisites, :subject, :string
  end
end
