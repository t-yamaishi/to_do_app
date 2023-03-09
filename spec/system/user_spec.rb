require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'ログインログアウト機能' do
    it 'ログアウトが成功'do
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました'
    end
    it 'ログインができ、管理ユーザーは管理画面にアクセスできる' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'xxx@xxx.com'
      fill_in 'パスワード', with: 'xxx@xxx.com'
      click_button 'ログイン'
      click_on '管理者画面'
      sleep 6
      expect(page).to have_content 'Admin'
    end
  end
  describe 'ユーザー作成、編集機能、削除' do
    it 'ユーザー新規作成、編集、削除が成功' do
      visit new_user_registration_path
      fill_in '名前', with: 'zakiyama'
      fill_in 'Eメール', with: 'zzz@zzz.com'
      fill_in 'パスワード', with: 'zzz@zzz.com', match: :first
      fill_in 'パスワード（確認用）', with: 'zzz@zzz.com'
      click_on 'アカウント登録'
      expect(page).to have_content 'zakiyama'
      click_on 'マイページの編集'
      fill_in '名前', with: 'aoyama'
      fill_in '現在のパスワード', with: 'zzz@zzz.com'
      click_on '更新'
      expect(page).to have_content 'aoyama'
      click_on 'マイページの編集'
      click_on 'アカウント削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'アカウントを削除しました'
    end
  end

  describe 'アクセス制限' do
    before do
      @user = FactoryBot.create(:non_admin_user)
    end
    it '他人の投稿にアクセスできない' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'yyy@yyy.com'
      fill_in 'パスワード', with: 'yyy@yyy.com'
      click_button 'ログイン'
      visit user_path(@admin_user.id)
      expect(page).to have_content 'ToDo一覧'
    end
  end
end
