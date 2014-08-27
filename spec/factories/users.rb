FactoryGirl.define do
  factory :task, class: 'Task' do
    title { generate :string }
    description { generate :string }
    state "opened"
    creator_id { (create :user).id }
    assigned_to_id { (create :user).id }
  end
end
