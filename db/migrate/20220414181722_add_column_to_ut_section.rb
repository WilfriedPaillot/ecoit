class AddColumnToUtSection < ActiveRecord::Migration[5.2]
  def change
    add_reference :ut_sections, :section, foreign_key: true
  end
end
