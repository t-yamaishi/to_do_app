5.times do |_n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password)
end

1.times do |_n|
  name = '低'
  Tag.create!(
    name: name
  )
end

1.times do |_n|
  name = '中'
  Tag.create!(
    name: name
  )
end

1.times do |_n|
  name = '高'
  Tag.create!(
    name: name
  )
end

1.times do |_n|
  name = '締切厳守'
  Tag.create!(
    name: name
  )
end

1.times do |_n|
  name = '遅延'
  Tag.create!(
    name: name
  )
end

1.times do |_n|
  name = 'admin'
  email = 'admin@admin.com'
  password = '1qazxsw2'
  admin = true
  @admin_user = User.create!(name: name,
                             email: email,
                             password: password,
                             admin: admin)
end

5.times do |_n|
  content = Faker::ProgrammingLanguage.name
  user_id = @admin_user.id
  status = '未実施'
  @post = Post.create!(content: content,
                       user_id: user_id,
                       status: status)
end

1.times do |_n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[0]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |_n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[1]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |_n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[2]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |_n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[3]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end

1.times do |_n|
  tag_id = Tag.all.ids[0]
  post_id = Post.all.ids[4]
  Tagging.create!(tag_id: tag_id,
                  post_id: post_id)
end
