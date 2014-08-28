class CreateUserTaskComments < ActiveRecord::Migration
  def change
    create_table :user_task_comments do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :task

      t.timestamps
    end
  end
end
