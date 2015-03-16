class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @course_plan = CoursePlan.find(params[:id])
  end

  def destroy
    @course_plan.destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, 
                                   :password, :password_confirmation)
    end
end
