class StaticPagesController < ApplicationController
  def homepage
    @trainings = Training.ordered.limit(3)
  end

  def instructor
  end

  def contact
  end
end
