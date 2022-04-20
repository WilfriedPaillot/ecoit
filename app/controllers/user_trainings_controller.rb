class UserTrainingsController < ApplicationController
    before_action :set_user_training, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    
  def index
    @user_trainings = UserTraining.where(user_id: current_user.id)
  end

  def show
    @user_training = UserTraining.find(params[:id])
    @user_training_sections = UtSection.where(user_training_id: @user_training.id)
  end

  def create
    if UserTraining.where(user_id: current_user.id, training_id: params[:training_id]).exists?
      redirect_to trainings_path, flash: { warning: "Cette formation fait déjà parti de votre médiathèque" }
    else
      @user_training = UserTraining.create(user_id: current_user.id, training_id: params[:training_id])
        Section.where(training_id: params[:training_id]).each do |section|
          UtSection.create(user_training_id: @user_training.id, section_id: section.id)
          Lesson.where(section_id: section.id).each do |lesson|
            # UtsLesson.create(ut_section_id: section.id, lesson_id: lesson.id)
            UtsLesson.create(ut_section_id: UtSection.last.id, lesson_id: lesson.id)
          end
        end
      redirect_to user_trainings_path, flash: { success: "La formation a bien été ajoutée à votre médiathèque" }
    end
  end

  # private
  # def user_training_params
  #   params.require(:user_training).permit(:user_id, :training_id)
  # end
end
