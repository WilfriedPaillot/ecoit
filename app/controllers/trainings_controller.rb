class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :instructor?, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @trainings = Training.search(params[:search])
      if @trainings.empty?
        flash.now[:danger] = "Aucun résultat pour \"#{params[:search]}\""
        @trainings = Training.ordered
      else
        @trainings.ordered
      end
    else
      @trainings = Training.ordered
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_details = Section.where(training_id: @training.id)
  end

  def new
    @training = Training.new
  end

  def edit
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    if @training.save
      redirect_to new_section_path(training_id: @training.id)
    end
  end

  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:title, :description, :user_id)
    end

    def instructor?
      if current_user.instructor?
        true
      else
        redirect_to trainings_path, flash: { danger: "Vous n'êtes pas autorisé à accéder à cette page" }
      end
    end
end
