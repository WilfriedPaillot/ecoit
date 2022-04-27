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
    actual_section = lesson.ut_section_id
    last_lesson = UtsLesson.where(ut_section_id: actual_section).last.id
    last_section_of_training = UtSection.where(user_training_id: UtSection.find(actual_section).user_training_id).last.id
    if actual_section != last_section_of_training
      first_lesson_of_next_section = UtsLesson.where(ut_section_id: actual_section.to_i + 1).first.id
    end
    
    if lesson.id != last_lesson
      redirect_to uts_lesson_path(lesson.id.to_i + 1)
    elsif actual_section != last_section_of_training
      redirect_to uts_lesson_path(first_lesson_of_next_section)
    else
      flash[:warning] = "Félicitations, vous avez terminé toutes les leçons de cette formation !"
      redirect_to dashboards_path
    end

    lesson.update_completion

  end
    
end
