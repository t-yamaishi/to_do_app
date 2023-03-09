require 'rails_helper'
RSpec.describe 'タグ機能', type: :system do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'タグ機能' do
    it '新規タグ登録、編集、削除' do
      visit new_user_session_path
      fill_in 'Eメール', with: "xxx@xxx.com"
      fill_in 'パスワード', with: "xxx@xxx.com"
      click_button 'ログイン'
      click_on 'ToDoMailer'
      click_on 'タグを作成する'
      fill_in '名前', with: '重要'
      click_on '登録する'
      expect(page).to have_content '重要'
      click_on '編集'
      fill_in 'edit_tag_test', with: '超重要'
      click_on '更新する'
      expect(page).to have_content '超重要'
      click_on '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'タグを削除しました'
    end
  end
end
