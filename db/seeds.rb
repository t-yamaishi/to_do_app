1.times do |n|
  name = 'admin'
  email = 'admin@admin.com'
  password = '1qazxsw2'
  admin = true
  @admin_user = User.create!(name: name,
                             email: email,
                             password: password,
                             admin: admin)
end

5.times do |n|
  content = Faker::ProgrammingLanguage.name
  user_id = @admin_user.id
  status = '未実施'
  @post = Post.create!(content: content,
                       user_id: user_id,
                       status: status)
end

5.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password)
end

1.times do |n|
  name = '低'
  user_id = @admin_user.id
  Tag.create!(
    name: name,
    user_id: user_id
  )
end

1.times do |n|
  name = '中'
  user_id = @admin_user.id
  Tag.create!(
    name: name,
    user_id: user_id
  )
end

1.times do |n|
  name = '高'
  user_id = @admin_user.id
  Tag.create!(
    name: name,
    user_id: user_id
  )
end

1.times do |n|
  name = '締切厳守'
  user_id = @admin_user.id
  Tag.create!(
    name: name,
    user_id: user_id
  )
end

1.times do |n|
  name = '遅延'
  user_id = @admin_user.id
  Tag.create!(
    name: name,
    user_id: user_id
  )
end

1.times do |n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[0]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |n|
  tag_id = Tag.all.ids[1]
  post_id = Post.all.ids[1]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |n|
  tag_id = Tag.all.ids[2]
  post_id = Post.all.ids[2]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |n|
  tag_id = Tag.all.ids[3]
  post_id = Post.all.ids[3]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |n|
  tag_id = Tag.all.ids[4]
  post_id = Post.all.ids[4]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end
