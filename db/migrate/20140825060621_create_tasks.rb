class CreateTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.string :title
      t.text :description
      t.belongs_to :creator
      t.belongs_to :assigned_to
      t.string :state

      t.timestamps
    end
  end
end
