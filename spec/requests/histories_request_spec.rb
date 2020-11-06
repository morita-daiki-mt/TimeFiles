require 'rails_helper'

RSpec.describe "Histories", type: :request do
  let(:user) { create(:user) }
  let(:task) { create(:task, user_id: user.id) }
  let(:history) { create(:history, user_id: user.id, task_id: task.id) }

  describe "GET histories#calendar" do
    before do
      sign_in user
    end

    it "リクエストが成功すること" do
      get calendar_path
      expect(response).to have_http_status "200"
    end
  end
end
