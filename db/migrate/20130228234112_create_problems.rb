class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :cod
      t.string :title
      t.text :description
      t.text :input_format
      t.text :output_format

      t.timestamps
    end
  end
end
