require 'test_helper'

class SemesterDefinitionTest < ActiveSupport::TestCase

  test "Semester_definitions needs name to be valid" do
    sm1 = SemesterDefinition.new
    sm1.in_year_position = 1
    assert sm1.invalid?, "Saved semester definition without a name " + sm1.name.to_s
    sm1.name = "Fall"
    assert sm1.valid?
  end

  test "Semester_definitions needs in_year_position to be valid" do
    sm1 = SemesterDefinition.new
    sm1.name = "Fall"
    assert sm1.invalid?, "Saved semester definition without a in_year_position " + sm1.in_year_position.to_s
    sm1.in_year_position = 1
    assert sm1.valid?
  end
end
