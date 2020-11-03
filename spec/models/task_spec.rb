require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'userとの関係' do
      let(:target) { :user }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'historyとの関係' do
      let(:target) { :histories }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
    subject { test_task.valid? }
    let(:task) { create(:task) }

    context 'content' do
      let(:test_task) { task }

      it '空欄ではない' do
        test_task.content = ''
        is_expected.to eq false
      end

      it '20文字以下ヴァリデーションが作動してる' do
        test_task.content = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
  end
end
