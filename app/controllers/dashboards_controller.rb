class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    if !user_signed_in?
      redirect_to(new_user_session_path, status: 302)
    else
      case current_user.what_role?
      when "student"
        redirect_to(dashboard_student_path, status: 302)
      when "instructor"
        redirect_to(dashboard_instructor_path, status: 302)
      when "admin"
        redirect_to(dashboard_admin_path, status: 302)
      end
    end
  end

  def student
    @user_trainings = UserTraining.where(user_id: current_user.id)
  end

  def instructor
    @trainings = Training.where(user_id: current_user.id)
  end

  def admin
  end

end
