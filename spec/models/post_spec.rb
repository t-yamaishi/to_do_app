require 'rails_helper'
RSpec.describe 'Postモデル', type: :model do
  before do
    @admin_user = FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    it 'contentが空のためバリデーションにひっかかる' do
      post = Post.new(content: '', status: '未実施', user_id: @admin_user.id)
      expect(post).not_to be_valid
      expect(post.errors.full_messages).to include("ToDo内容を入力してください")
    end
    it 'contentが空のためバリデーションにひっかかる' do
      post = Post.new(content: 'テスト' * 20, status: '未実施', user_id: @admin_user.id)
      expect(post).not_to be_valid
      expect(post.errors.full_messages).to include("ToDo内容は20文字以内で入力してください")
    end
  end
end
