class CreateUtSections < ActiveRecord::Migration[5.2]
  def change
    create_table :ut_sections do |t|
      t.references :user_training, foreign_key: true
      t.integer :completion_rate, default: 0

      t.timestamps
    end
  end
end
