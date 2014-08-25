class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :discription
      t.belongs_to :creator
      t.belongs_to :assigned_to
      t.string :state

      t.timestamps
    end
  end
end
