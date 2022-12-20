require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  # describe '管理者画面にアクセス' do
  #   context '管理ユーザー' do
  #     it 'ログアウトできる'do
  #       visit new_user_session_path
  #       fill_in 'Eメール', with: 'xxx@xxx.com'
  #       fill_in 'パスワード', with: 'xxx@xxx.com'
  #       click_button 'ログイン'
  #       click_on 'ログアウト'
  #     end
  #     it 'ログインができ、管理ユーザーは管理画面にアクセスできる' do
  #       visit new_user_session_path
  #       fill_in 'Eメール', with: 'xxx@xxx.com'
  #       fill_in 'パスワード', with: 'xxx@xxx.com'
  #       click_button 'ログイン'
  #       click_on 'マイページへ'
  #       click_on '管理者画面'
  #       sleep 1
  #       expect(page).to have_content 'サイト管理'
  #     end
  #   end
  # end
  describe 'ユーザー機能' do
    context 'ユーザー作成、詳細機能、編集機能' do
      it 'ユーザー新規作成後、詳細画面が表示、編集ができる' do
        visit new_user_registration_path
        fill_in '名前', with: 'z'
        fill_in 'Eメール', with: 'zzz@zzz.com'
        fill_in 'パスワード', with: 'zzz@zzz.com', match: :first
        fill_in 'パスワード（確認用）', with: 'zzz@zzz.com'
        click_on 'アカウント登録'
        expect(page).to have_content 'z'
        click_on 'マイページの編集'
        fill_in '名前', with: 'a'
        fill_in '現在のパスワード', with: 'zzz@zzz.com'
        click_on '更新'
        expect(page).to have_content 'a'
      end
    end
  end

    describe 'アクセス制限' do
      before do
        @user=FactoryBot.create(:non_admin_user)
      end
        context '一般ユーザー' do
          it '他人の投稿にアクセスできない'do
            visit new_user_session_path
            fill_in 'Eメール', with: 'yyy@yyy.com'
            fill_in 'パスワード', with: 'yyy@yyy.com'
            click_button 'ログイン'
            visit user_path(@admin_user.id)
            expect(page).to have_content 'ToDo一覧'
          end
        end
    end
end
