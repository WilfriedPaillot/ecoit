class UtsLessonsController < ApplicationController
  def index
  end

  def show
    @uts_lesson = UtsLesson.find(params[:id])
    @lesson = Lesson.find_by_id(@uts_lesson.lesson_id)
    @next = Lesson.find_by_id(@lesson.id.to_i + 1)
  end
  
  def update
    lesson = UtsLesson.find(params[:id])

    if lesson.completed != true
      lesson.update(completed: true)
      section = UtSection.find(UtsLesson.find_by(ut_section_id: lesson.ut_section_id).ut_section_id)
      section.update(completion_rate: section.completion_rate.to_i + 1)
    end

    if UtsLesson.where(id: lesson.id.to_i + 1).exists?
      redirect_to uts_lesson_path(lesson.id.to_i + 1)
    else
      flash[:warning] = "Félicitations, vous avez terminé toutes les leçons de cette formation !"
      redirect_to user_trainings_path(current_user)
    end
  end
end
