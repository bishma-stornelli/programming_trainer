class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.references :problem
      t.string :title
      t.attachment :input
      t.attachment :output
      t.float :max_time

      t.timestamps
    end
    add_index :test_cases, :problem_id
  end
end
