module Api
  class V1::UsersController < Api::V1::BaseController

    private
      def users_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end

      # May want to expose for querying by certain params
      #def query_params
      #end

  end
end
