class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.section_id = @lesson[:section_id]
    if @lesson.save
      redirect_to training_path(@lesson.section.training)
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :content, :section_id)
  end

  def set_section
    @section = Section.find(params[:id])
  end
end
