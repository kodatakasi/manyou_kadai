FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test1@example.com" }
    password { "passwordpassword" }
    admin { 'true' }
  end

  factory :second_user, class: User do
    name { 'テストユーザー２' }
    email { 'test2@example.com' }
    password { 'password02' }
    admin { 'false' }
  end

  factory :another_user, class: User do
    name { 'テストユーザー３' }
    email { 'test3@example.com' }
    password { 'password03' }
    admin { 'false' }
  end
end
