require 'rails_helper'
RSpec.describe 'Postモデル', type: :model do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    context 'contentが空の場合' do
      it 'バリデーションにひっかかる' do
        post = Post.new(content: '', status: '未実施', user_id: @admin_user.id)
        expect(post).not_to be_valid
      end
    end
  end
  describe 'todo登録' do
    context '入力に不足がない時' do
      it 'todo登録が成功する' do
        post = Post.new(content: 'a', status: '未実施', user_id: @admin_user.id)
        expect(post).to be_valid
      end
    end
  end
end
