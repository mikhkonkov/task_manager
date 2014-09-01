class User::TaskCreateType < User::Task
  include ApplicationType

  validates :title, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :creator, presence: true

  permit :title, :description, :state, :creator_id, :assigned_to_id, comments_attributes: [:id, :content, :user_id, :user, :task_id, :task,  :_destroy]
end
