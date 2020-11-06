require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let(:task) { create(:task, user_id: user.id) }
  let(:history) { create(:history, user_id: user.id, task_id: task.id) }

  describe "GET tasks#index" do
    before do
      sign_in user
    end

    it "リクエストが成功すること" do
      get tasks_path
      expect(response).to have_http_status "200"
    end
  end

  describe "GET tasks#show" do
    before do
      sign_in user
    end

    it "リクエストが成功すること" do
      get task_path(task.id)
      expect(response).to have_http_status "200"
    end
  end

end
