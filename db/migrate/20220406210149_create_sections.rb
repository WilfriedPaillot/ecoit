class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :title       , null: false
      t.text :description   , null: false
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
