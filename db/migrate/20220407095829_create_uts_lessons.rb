class CreateUtsLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :uts_lessons do |t|
      t.references :ut_section, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
