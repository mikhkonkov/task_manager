class User < ActiveRecord::Base
  has_many :created_tasks, foreign_key: :creator_id, class_name: 'Task', dependent: :destroy
  has_many :assigned_tasks, foreign_key: :assigned_to_id, class_name: 'Task', dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
