class StaticPagesController < ApplicationController
  def homepage
    @trainings = Training.ordered_by_created_at.limit(3)
  end

  def instructor
  end

  def contact
  end
end
