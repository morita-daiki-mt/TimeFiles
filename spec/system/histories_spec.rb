require 'rails_helper'

RSpec.describe 'Histories', type: :system do
  let(:user) { create(:user) }
  let(:task) { create(:task) }
  let(:history) { create(:history) }

  describe 'indexページ' do
    context 'タスク追加関連' do
      before do
        login_user user
        visit tasks_path
        click_button 'ADD NEW TASK'
      end
      it 'タスク追加に成功する' do
        fill_in 'task_content', with: 'test'
        fill_in 'action_at', with: Faker::Date.backward
        click_button '作成'
        expect(page).to have_content 'test'
      end
      it 'タスク追加に失敗する' do
        expect do
          fill_in 'task_content', with: 'test'
          fill_in 'action_at', with: ''
          click_button '作成'
        end.to change(History, :count).by 0
      end
      it '最終実行日が機能している' do
        fill_in 'task_content', with: 'test'
        fill_in 'action_at', with: Date.today - 1
        click_button '作成'
        expect(page).to have_content '1 DAYS AGO'
      end
    end
    context 'タスクごとの機能' do
      before do
        login_user user
        visit tasks_path
        click_button 'ADD NEW TASK'
        fill_in 'task_content', with: 'test'
        fill_in 'action_at', with: Faker::Date.backward
        click_button '作成'
      end
      it 'TODAYボタンが機能している' do
        click_button 'TODAY'
        expect(page).to have_content '0 DAYS AGO'
      end
    end
  end

  describe 'showページ' do
    
  end
end