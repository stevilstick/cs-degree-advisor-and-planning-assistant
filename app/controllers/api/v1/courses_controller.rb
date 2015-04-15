module Api
  class V1::CoursesController < Api::V1::BaseController

    private
      def course_params
        params.permit(:name, :subject, :call_number, :description, :credit_hours)
      end

      # May want to expose for querying plans by student_id?
      #def query_params
      #  params.permit(:student_id)
      #end

  end
end
