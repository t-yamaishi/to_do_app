require 'rails_helper'
RSpec.describe 'タグ機能', type: :system do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'タグ登録' do
    context 'adminユーザー' do
      it '新規タグ登録、編集、削除'do
        visit new_user_session_path
        fill_in 'Eメール', with: 'xxx@xxx.com'
        fill_in 'パスワード', with: 'xxx@xxx.com'
        click_button 'ログイン'
        visit tags_path
        click_on '新規タグ作成'
        fill_in '名前', with: '重要'
        click_on '登録する'
        click_on '戻る'
        expect(page).to have_content '重要'
        click_on '編集'
        fill_in '名前', with: '超重要'
        click_on '更新する'
        click_on '戻る'
        expect(page).to have_content '超重要'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'タグが削除されました。'
      end
    end
  end

  describe 'アクセス制限' do
    before do
      @user=FactoryBot.create(:non_admin_user)
    end
    context '一般ユーザー' do
      it 'タグ機能にアクセスできない'do
        visit new_user_session_path
        fill_in 'Eメール', with: 'yyy@yyy.com'
        fill_in 'パスワード', with: 'yyy@yyy.com'
        click_button 'ログイン'
        visit tags_path
        expect(page).to have_content '詳細画面'
      end
    end
  end
end
