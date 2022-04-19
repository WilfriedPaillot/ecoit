class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.training_id = @section[:training_id]
    if @section.save
      redirect_to new_lesson_path(section_id: @section.id)
    end
  end

  private
  def section_params
    params.require(:section).permit(:title, :description, :training_id)
  end

  def set_section
    @section = Section.find(params[:id])
  end
end
