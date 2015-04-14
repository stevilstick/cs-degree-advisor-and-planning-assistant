module Api
  class V1::YearsController < Api::V1::BaseController

    private
      def year_params
        params.permit(:year, :course_plan_id)
      end

      # May want to expose for querying plans by student_id?
      #def query_params
      #  params.permit(:student_id)
      #end

  end
end
