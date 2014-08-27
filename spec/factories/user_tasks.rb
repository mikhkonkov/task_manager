FactoryGirl.define do
  factory 'user/task' do
    title { generate :string }
    description { generate :string }
    state "opened"
    creator_id { (create :user).id }
    assigned_to_id { (create :user).id }
  end
end
