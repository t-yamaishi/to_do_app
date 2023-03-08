# require 'rails_helper'
# RSpec.describe 'todo作成機能', type: :system do
#   before do
#     @admin_user = FactoryBot.create(:user)
#     FactoryBot.create(:tag)
#   end
#   describe 'todo機能' do
#     context '登録、編集、削除' do
#       it 'todo登録、編集、削除ができる' do
#         visit new_user_session_path
#         fill_in 'Eメール', with: 'xxx@xxx.com'
#         fill_in 'パスワード', with: 'xxx@xxx.com'
#         click_button 'ログイン'
#         click_on '新しいtodo作成'
#         fill_in 'ToDo内容', with: '掃除'
#         select '2022', from: 'post[deadline(1i)]'
#         select '12月', from: 'post[deadline(2i)]'
#         select '18', from: 'post[deadline(3i)]'
#         select '11', from: 'post[deadline(4i)]'
#         select '11', from: 'post[deadline(5i)]'
#         select '低', from: 'post[tag_ids]'
#         select '未実施', from: 'post[status]'
#         click_on '登録する'
#         expect(page).to have_content '掃除'
#         click_on '編集'
#         fill_in 'ToDo内容', with: '洗濯'
#         click_on '更新する'
#         click_on '戻る'
#         expect(page).to have_content '洗濯'
#         click_on '削除'
#         page.driver.browser.switch_to.alert.accept
#         expect(page).to have_content 'ToDoが削除されました。'
#       end
#     end
#   end

#   describe '検索機能' do
#     context '検索条件を全て指定する' do
#       it '検索結果が表示される' do
#         visit new_user_session_path
#         fill_in 'Eメール', with: 'xxx@xxx.com'
#         fill_in 'パスワード', with: 'xxx@xxx.com'
#         click_button 'ログイン'
#         click_on '新しいtodo作成'
#         fill_in 'ToDo内容', with: '掃除'
#         select '2022', from: 'post[deadline(1i)]'
#         select '12月', from: 'post[deadline(2i)]'
#         select '18', from: 'post[deadline(3i)]'
#         select '11', from: 'post[deadline(4i)]'
#         select '11', from: 'post[deadline(5i)]'
#         select '低', from: 'post[tag_ids]'
#         select '未実施', from: 'post[status]'
#         click_on '登録する'
#         click_on '戻る'
#         fill_in 'q[content_cont]', with: '掃除'
#         fill_in 'q[deadline_gteq]', with: '002022-12-17'
#         fill_in 'q[deadline_lteq]', with: '002022-12-19'
#         select '低', from: 'q[taggings_tag_id_eq]'
#         select '未実施', from: 'q[status_eq]'
#         click_on '検索'
#         expect(page).to have_content '掃除'
#       end
#     end
#   end

#   describe 'アクセス制限' do
#     before do
#       @user = FactoryBot.create(:non_admin_user)
#       @post = Post.create(content: '最初のtodo', status: '未実施', user_id: @admin_user.id)
#     end
#     context '一般ユーザー' do
#       it '他人の投稿にアクセスできない' do
#         visit new_user_session_path
#         fill_in 'Eメール', with: 'yyy@yyy.com'
#         fill_in 'パスワード', with: 'yyy@yyy.com'
#         click_button 'ログイン'
#         visit edit_post_path(@post)
#         expect(page).to have_content 'ToDo一覧'
#         visit post_path(@post)
#         expect(page).to have_content 'ToDo一覧'
#       end
#     end
#   end

#   describe '投稿ソート機能' do
#     before do
#       @post = Post.create(content: 'a', deadline: Time.zone.now, status: '未実施', user_id: @admin_user.id)
#       @post = Post.create(content: 'b', deadline: 1.day.from_now, status: '未実施', user_id: @admin_user.id)
#     end
#     context 'ソート機能(締切日時)' do
#       it '順番が降順になる' do
#         visit new_user_session_path
#         fill_in 'Eメール', with: 'xxx@xxx.com'
#         fill_in 'パスワード', with: 'xxx@xxx.com'
#         click_button 'ログイン'
#         sleep 1
#         click_on '締切日時'
#         sleep 1
#         click_on '締切日時'
#         sleep 3
#         post_list = all('.name')
#         sleep 2
#         expect(post_list[0]).to have_content 'b'
#         expect(post_list[1]).to have_content 'a'
#       end
#     end
#   end
# end
