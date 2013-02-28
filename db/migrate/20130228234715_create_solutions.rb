class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :user
      t.references :problem
      t.date :date
      t.integer :status
      t.float :time_running
	  t.attachment :file

      t.timestamps
    end
    add_index :solutions, :user_id
    add_index :solutions, :problem_id
  end
end
