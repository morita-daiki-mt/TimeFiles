require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: "") }
  let!(:login_user) do
    create(:user,
            email: 'test@example.com',
            password: '123456',
            password_confirmation: '123456')
  end

  describe 'アカウント作成' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'パスワードが暗号化されていること' do
        expect(user.password).to_not eq "password"
      end

      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end
    end
  end

  describe 'ログイン' do
    context 'パラメーターが妥当な場合' do
      it 'ログインに成功すること' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'test@example.com'
        fill_in 'パスワード', with: '123456'
        click_button 'ログイン'
        expect(page).to have_button 'ADD NEW TASK'
      end
    end

    context 'パラメーターが不正な場合' do
      it 'ログインに失敗すること' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'test@example.com'
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(page).to have_button 'ログイン'
      end
    end
  end
end
