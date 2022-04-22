class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to training_path(@lesson.section.training)
    end
  end

  def destroy
    @lesson.destroy
    if @lesson.destroy
      redirect_to training_path(@lesson.section.training)
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :content, :section_id)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
