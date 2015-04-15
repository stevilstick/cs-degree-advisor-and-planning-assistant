module Api
  class V1::CourseInstancesController < Api::V1::BaseController

    private
      def course_instance_params
        params.permit(:course_id, :semester_id, :student_id, :rotation_id)
      end

  end
end
