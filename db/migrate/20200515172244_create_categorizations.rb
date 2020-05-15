class CreateCategorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
