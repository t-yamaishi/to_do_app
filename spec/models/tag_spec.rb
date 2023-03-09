require 'rails_helper'
RSpec.describe 'Tagモデル', type: :model do
  describe 'nameバリデーションのテスト' do
    it 'nameが空の場合バリデーションにひっかかる' do
      tag = Tag.new(name: '')
      expect(tag).not_to be_valid
      expect(tag.errors.full_messages).to include("名前を入力してください")
    end
    it '文字数が10文字以上のためバリデーションにひっかかる' do
      tag = Tag.new(name: 'テスト' * 10)
      expect(tag).not_to be_valid
      expect(tag.errors.full_messages).to include("名前は10文字以内で入力してください")
    end
  end
end
