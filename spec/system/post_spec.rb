require 'rails_helper'
RSpec.describe 'todo作成機能', type: :system do
  let!(:admin_user) { FactoryBot.create(:user) }
  let!(:tag) { FactoryBot.create(:tag, user_id: admin_user.id) }
  describe 'todo機能' do
    it 'todo登録、編集、削除ができる' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'ToDo投稿'
      fill_in 'ToDo内容', with: '掃除'
      select '2022', from: 'post[deadline(1i)]'
      select '12月', from: 'post[deadline(2i)]'
      select '18', from: 'post[deadline(3i)]'
      select '11', from: 'post[deadline(4i)]'
      select '11', from: 'post[deadline(5i)]'
      check "低"
      select '未実施', from: 'post[status]'
      click_on '登録する'
      expect(page).to have_content '掃除'
      click_on '編集'
      fill_in 'edit_post_test', with: '洗濯'
      click_on '更新する'
      expect(page).to have_content '洗濯'
      click_on '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'ToDoが削除されました'
    end
  end

  describe '検索機能' do
    it '検索結果が表示される' do
      FactoryBot.create(:post, user_id: admin_user.id )
      post = FactoryBot.create(:post_done, user_id: admin_user.id )
      FactoryBot.create(:tagging, tag_id: tag.id, post_id: post.id )
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'ToDo投稿'
      fill_in 'q[content_cont]', with: '学習'
      fill_in 'q[deadline_gteq]', with: '002022-12-17'
      fill_in 'q[deadline_lteq]', with: '002022-12-19'
      select '低', from: 'q[taggings_tag_id_eq]'
      select '実施', from: 'q[status_eq]'
      click_on '検索'
      expect(page).to have_content '学習'
    end
  end

  describe '投稿ソート機能' do
    it '順番が降順になる' do
      Post.create(content: '歩く', deadline: Time.zone.now, status: '未実施', user_id: admin_user.id)
      Post.create(content: '走る', deadline: 1.day.from_now, status: '未実施', user_id: admin_user.id)
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'ToDo投稿'
      sleep 1
      click_on '締切日時'
      sleep 1
      click_on '締切日時'
      sleep 3
      post_list = all('.name')
      sleep 2
      expect(post_list[0]).to have_content '走る'
      expect(post_list[1]).to have_content '歩く'
    end
  end

  describe 'カレンダー機能' do
    before do
      Post.create(content: 'a', deadline: Time.zone.now, start_time: Time.zone.now, status: '未実施', user_id: admin_user.id)
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'カレンダーを確認'
    end

    it 'カレンダーにToDo表示されている' do
      expect(page).to have_content '未実施'
    end

    it 'カレンダーからToDo編集ができる' do
      click_on 'calendar_edit_test'
      select '実施', from: 'post[status]'
      click_on '更新する'
      expect(page).to have_content '実施'
    end

    it 'カレンダー画面からToDO新規作成ができる' do
      click_on '新規作成'
      fill_in 'post_content', with: '掃除'
      select '2023', from: 'post[deadline(1i)]'
      select '3月', from: 'post[deadline(2i)]'
      select '18', from: 'post[deadline(3i)]'
      click_on '登録する'
      expect(page).to have_content '未実施'
    end
  end
end
