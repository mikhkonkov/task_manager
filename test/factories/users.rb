FactoryGirl.define do
  factory :user, class: 'User' do
    name     "Test User"
    email     { generate :email }
    password "foobar"
    password_confirmation "foobar"
  end
end
