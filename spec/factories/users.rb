FactoryBot.define do
  factory :user do
    email { 'xxx@xxx.com' }
    name { 'xxx@xxx.com' }
    password { 'xxx@xxx.com' }
    password_confirmation { 'xxx@xxx.com' }
    admin { true }
  end
end

FactoryBot.define do
  factory :non_admin_user, class: 'User' do
    email { 'yyy@yyy.com' }
    name { 'yyyx@yyy.com' }
    password { 'yyy@yyy.com' }
    password_confirmation { 'yyy@yyy.com' }
    admin { false }
  end
end
