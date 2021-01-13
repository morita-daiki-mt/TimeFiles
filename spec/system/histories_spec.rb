require 'rails_helper'

RSpec.describe 'Histories', type: :system do
  let(:history) { create(:history) }
  let(:task) { history.task }
  let(:user) { task.user}
  let(:yesterday) { Date.today - 1 }

  describe 'indexページ' do
    context 'タスク追加関連' do
      before do
        login_user user
        visit tasks_path
        click_button '新規タスク'
      end
      it 'タスク追加に成功する' do
        fill_in 'task_content', with: 'test'
        find("#flatpickr").click
        find(".today").click
        click_button '新規作成'
        expect(page).to have_content 'test'
      end
      it '日付選択なしの場合タスク追加に失敗する' do
        expect do
          fill_in 'task_content', with: 'test'
          click_button '新規作成'
        end.to change(History, :count).by 0
      end
      it '日付選択なしの場合タスク追加に失敗する' do
        expect do
          find("#flatpickr").click
          find(".today").click
          click_button '新規作成'
        end.to change(History, :count).by 0
      end
      it '最終実行日が機能している' do
        fill_in 'task_content', with: 'test'
        find("#flatpickr").click
        find(".today").click
        click_button '新規作成'
        expect(page).to have_content '0 DAYS AGO'
      end
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
    it '実行日を追加できる' do
      find("#flatpickr").click
      find(".today").click
      click_button '追加'
      expect(page).to have_content Date.today.strftime("%Y年 %m月 %d日")
    end
    it '実行日を削除する' do
      expect do
        find('.historydeletebtn').click
        click_button '削除する'
      end.to change(History, :count).by(-1)
      expect(page).to have_content 'NO DATE'
    end
  end

  describe 'カレンダーページ' do
    before do
      login_user user
      visit tasks_path
      click_button '新規タスク'
      fill_in 'task_content', with: 'Calendar_test'
      find("#flatpickr").click
      find(".today").click
      click_button '新規作成'
      visit calendar_path
    end

    it 'カレンダーが機能している' do
      expect(page).to have_content 'Calendar_test'
    end
  end
end