FactoryGirl.define do
  factory :jenny, class: 'User' do
    email "j@j.com"
    password "12345678"
    password_confirmation "12345678"
  end
end 