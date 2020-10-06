require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:login_user) do
    create(:user,
            email: 'test@example.com',
            password: '123456',
            password_confirmation: '123456')
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


