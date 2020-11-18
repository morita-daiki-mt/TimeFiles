require 'rails_helper'

RSpec.describe History, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'taskとの関係' do
      let(:target) { :task }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
    subject { test_history.valid? }
    let(:history) { create(:history) }

    context 'content' do
      let(:test_history) { history }

      it '空欄ではない' do
        test_history.action_at = ''
        is_expected.to eq false
      end

      it '未来の日付ではない' do
        test_history.action_at = Date.today + 1
        is_expected.to eq false
      end
    end
  end
end
