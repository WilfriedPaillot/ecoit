class UserTrainingsController < ApplicationController

  def create
    if UserTraining.where(user_id: current_user.id, training_id: params[:training_id]).exists?
      redirect_to trainings_path, flash: { warning: "Cette formation fait déjà parti de votre médiathèque" }
    else
      @user_training = UserTraining.new(user_id: current_user.id, training_id: params[:training_id])
        Section.where(training_id: params[:training_id]).each do |section|
          UtSection.create(user_training_id: @user_training.id)
            Lesson.where(section_id: section.id).each do |lesson|
              UtsLesson.create(ut_section_id: section.id)
            end
        end
      if @user_training.save
        redirect_to trainings_path, flash: { success: "La formation #{@user_training.training.title.upcase} a bien été ajoutée à votre médiathèque" }
      else
        flash[:danger] = "Oops, une erreur est survenue"
      end
    end
  end

end
