module Api
  class V1::CoursePlansController < Api::V1::BaseController

    private
      def course_plan_params
        params.permit(:student_id, :plan_name)
      end

      # May want to expose for querying plans by student_id?
      #def query_params
      #  params.permit(:student_id)
      #end

  end
end
