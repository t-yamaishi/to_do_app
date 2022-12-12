require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe '管理ユーザーアクセス制限機能' do
    context '管理ユーザーアクセス制限機能' do
      it '管理ユーザーは管理画面にアクセスできる' do
        visit new_session_path
        fill_in 'Email', with: 'xxx@xxx.com'
        fill_in 'Password', with: 'xxx@xxx.com'
        click_on 'Log in'
        click_on '管理者画面へ'
        expect(page).to have_content 'Admin'
      end

      it '一般ユーザーはアクセスできない' do
        visit new_session_path
        fill_in 'Email', with: 'yyy@yyy.com'
        fill_in 'Password', with: 'yyy@yyy.com'
        click_on 'Log in'
        click_on '管理者画面へ'
        expect(page).to have_content 'タスク一覧'
      end
    end
  end
end
