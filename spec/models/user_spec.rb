require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'taskとの関係' do
      let(:target) { :tasks }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'historyとの関係' do
      let(:target) { :histories }

      it '1:Nとなっている(taskが中間なので多対多)' do
        expect(association.macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
    subject { test_user.valid? }
    let(:user) { create(:user) }
    let(:user_2) { create(:user) }

    context 'email' do
      let(:test_user) { user }
      let(:test_user_2) { user_2 }

      it '空欄ではない' do
        test_user.email = ''
        is_expected.to eq false
      end

      it '一意' do
        test_user.email = 'test1@test.co.jp'
        test_user.save
        test_user_2.email = 'test1@test.co.jp'
        test_user_2.save
        test_user_2.valid?
        expect(test_user_2).to be_invalid
      end
    end

    context 'passwordカラム' do
      let(:test_user) { user }

      it '空欄ではない' do
        test_user.password = ''
        is_expected.to eq false
      end

      it 'パスワード不一致防止' do
        test_user.password = "password1"
        test_user.password_confirmation = "password2"
        test_user.valid?
        expect(test_user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it '6文字以上ヴァリデーションが作動してる' do
        test_user.password = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end

      it '６文字未満の場合はエラーが出る' do
        test_user.password = Faker::Lorem.characters(number: 1)
        test_user.valid?
        expect(test_user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end
