class UtSection < ApplicationRecord
  belongs_to :user_training
  belongs_to :section
  has_many :uts_lessons
  has_many :lessons, through: :uts_lessons
  
  def completion_rate_percentage
    if uts_lessons.where(completed: true).count > 0
      completion_rate = uts_lessons.where(completed: true).count * 100 / uts_lessons.count
    else
      completion_rate = 0
    end
    
    completion_rate.to_s + '%'
  end

  def is_empty?
    uts_lessons.empty?
  end

  def get_first_lesson
    uts_lessons.first.id
  end

  def get_lessons_count
    uts_lessons.count
  end

end
