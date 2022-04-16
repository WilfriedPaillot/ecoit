class AddColumnToUtsLesson < ActiveRecord::Migration[5.2]
  def change
    add_reference :uts_lessons, :lesson, foreign_key: true
  end
end
