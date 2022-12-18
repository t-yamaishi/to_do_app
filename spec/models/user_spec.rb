require 'rails_helper'
RSpec.describe 'Userモデル', type: :model do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'バリデーションにひっかかる(nameがないため)' do
        user=User.new(name: "", email: "zzz@zzz.com", password: "1qazxsw2")
        expect(user).not_to be_valid
      end
    end
  end

  describe 'ユーザー登録テスト' do
    context 'emali,password' do
      it 'emailが一意でない。' do
        user=User.new(name: "a", email: "xxx@xxx.com", password: "1qazxsw2")
        expect(user).not_to be_valid
      end
      it 'emailがない。' do
        user=User.new(name: "a", email: "", password: "1qazxsw2")
        expect(user).not_to be_valid
      end
      it 'passwordがない。' do
        user=User.new(name: "a", email: "zzz@zzz.com", password: "")
        expect(user).not_to be_valid
      end
    end
  end
end
