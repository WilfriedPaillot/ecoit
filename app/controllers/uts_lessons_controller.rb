class UtsLessonsController < ApplicationController
  def index
  end

  def show
    @uts_lesson = UtsLesson.find(params[:id])
    @lesson = Lesson.find_by_id(@uts_lesson.lesson_id)
  end
  
  def update
    lesson = UtsLesson.find(params[:id])
    lesson.update(completed: true)
    # redirect_to uts_lesson_path(lesson.id.to_i + 1)
    if UtsLesson.where(id: lesson.id.to_i + 1).exists?
      redirect_to uts_lesson_path(lesson.id.to_i + 1)
    else
      flash[:notice] = "Félicitations, vous avez terminé toutes les leçons !"
      # redirect_to user_trainings_path(current_user)
      return
    end
  end
end
