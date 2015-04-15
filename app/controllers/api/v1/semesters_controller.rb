module Api
  class V1::SemestersController < Api::V1::BaseController

    private
      def semester_params
        params.permit(:year_id, :name)
      end

      # May want to expose for querying plans by student_id?
      #def query_params
      #  params.permit(:student_id)
      #end

  end
end
