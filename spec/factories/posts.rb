FactoryBot.define do
  factory :post do
    content { '運動' }
    user_id { user_id }
    status { '未実施' }
  end
end

FactoryBot.define do
  factory :post_done, class: 'Post' do
    content { '学習' }
    user_id { user_id }
    deadline {'002022-12-17'}
    status { '実施' }
  end
end
