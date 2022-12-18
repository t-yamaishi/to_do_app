require 'rails_helper'
RSpec.describe 'Tagモデル', type: :model do
  describe 'バリデーションのテスト' do
    context 'contentが空の場合' do
      it 'バリデーションにひっかかる' do
        tag=Tag.new(name: "")
        expect(tag).not_to be_valid
      end
    end
  end

end
