class UtsLesson < ApplicationRecord
  belongs_to :ut_section
  belongs_to :lesson

  def update_completion
    if self.completed != true
      self.update(completed: true)
    end
  end

end
