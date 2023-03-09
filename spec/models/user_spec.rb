require 'rails_helper'
RSpec.describe 'Userモデル', type: :model do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'name, emali, passwordカラムのバリデーションのテスト' do
    it 'nameが空の場合バリデーションにひっかかる' do
      user = User.new(name: '', email: 'zzz@zzz.com', password: '1qazxsw2')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("名前を入力してください")
    end

    it 'emailが一意でない。' do
      user = User.new(name: 'a', email: 'xxx@xxx.com', password: '1qazxsw2')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'emailがない。' do
      user = User.new(name: 'a', email: '', password: '1qazxsw2')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'passwordがない。' do
      user = User.new(name: 'a', email: 'zzz@zzz.com', password: '')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("パスワードを入力してください")
    end
  end
end
