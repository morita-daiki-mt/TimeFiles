require 'rails_helper'

RSpec.describe 'Histories', type: :system do
  let(:history) { create(:history) }
  let(:task) { history.task }
  let(:user) { task.user}

  describe 'indexページ' do
    context 'タスク追加関連' do
      before do
        login_user user
        visit tasks_path
        click_button 'ADD NEW TASK'
      end
      # it 'タスク追加に成功する' do
      #   fill_in 'task_content', with: 'test'
      #   fill_in 'flatpickr', with: Faker::Date.backward
      #   click_button 'CREATE'
      #   expect(page).to have_content 'test'
      # end
      # it 'タスク追加に失敗する' do
      #   expect do
      #     fill_in 'task_content', with: 'test'
      #     fill_in 'flatpickr', with: ''
      #     click_button 'CREATE'
      #   end.to change(History, :count).by 0
      # end
      # it '最終実行日が機能している' do
      #   fill_in 'task_content', with: 'test'
      #   fill_in 'flatpickr', with: Date.today - 1
      #   click_button 'CREATE'
      #   expect(page).to have_content '1 DAYS AGO'
      # end
    end
    context 'タスクごとの機能' do
      before do
        login_user user
        visit tasks_path
      end
      it 'TODAYボタンが機能している' do
        click_button 'TODAY'
        expect(page).to have_content '0 DAYS AGO'
      end
      it '削除ボタンでTaskが消える' do
        expect do
          find('.deletebtn').click
          click_button '削除する'
        end.to change(Task, :count).by(-1)
      end
      it '削除ボタンでTaskと一緒にHistoryも消える' do
        expect do
          find('.deletebtn').click
          click_button '削除する'
        end.to change(History, :count).by(-1)
      end
    end
  end

  describe 'showページ' do
    before do
      login_user user
      visit task_path(task)
    end
    it 'タスク名を変更できる' do
      fill_in 'task_content', with: 'TimeFilesテスト'
      click_button 'タスク更新'
      visit tasks_path
      expect(page).to have_content'TimeFilesテスト'
    end
    it 'メモを追加できる' do
      fill_in 'task_memo', with: 'タスクメモ'
      click_button 'タスク更新'
      expect(page).to have_content'タスクメモ'
    end
    it 'タスク削除ボタンでTaskが消える' do
      expect do
        click_button 'タスク削除'
        click_button '削除する'
      end.to change(Task, :count).by(-1)
    end
    it 'タスク削除ボタンでTaskと一緒にHistoryも消える' do
      expect do
        click_button 'タスク削除'
        click_button '削除する'
      end.to change(History, :count).by(-1)
    end
    # it '実行日を追加できる' do
    #   fill_in 'ADD DATE', with: '2020-10-07'
    #   click_button 'ADD'
    #   expect(page).to have_content '2020年 10月 07日'
    # end
    it '実行日を削除する' do
      expect do
        find('.historydeletebtn').click
        click_button '削除する'
      end.to change(History, :count).by(-1)
      expect(page).to have_content 'NO DATE'
    end
  end

  # describe 'カレンダーページ' do
  #   before do
  #     login_user user
  #     visit tasks_path
  #     click_button 'ADD NEW TASK'
  #     fill_in 'task_content', with: 'Calendar_test'
  #     fill_in 'flatpickr', with: Date.today
  #     click_button 'CREATE'
  #     visit calendar_path
  #   end

  #   it 'カレンダーが機能している' do
  #     expect(page).to have_content 'Calendar_test'
  #   end
  # end
end