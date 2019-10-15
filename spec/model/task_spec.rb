require 'rails_helper'
RSpec.describe Task, type: :model do
  before do
    @user = User.create(
      name: "test_user",
      email: "test@example.com",
      password_digest: "password",
    
    )

    @task = Task.create(
      task_name: "model_test-01",
      memo: "testtesttest",
      status: 0,
      user_id: @user.id,
    )

    @other_task = Task.create(
      task_name: "model_test-02",
      memo: "samplesample",
      status: 1,
      user_id: @user.id,
    )

    @my_task = Task.create(
      task_name: "model_test-03",
      memo: "samplesample",
      status: 0,
      user_id: @user.id,
    )
  end

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(task_name: '', memo: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', memo: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(task_name: '成功テスト', memo: '成功テスト', user_id: @user.id)
    expect(task).to be_valid
  end

  it "タイトル検索した場合、タイトルが含まれる検索結果を出す" do
    expect(Task.search_task_name("model")).to include(@task)
    expect(Task.search_task_name("model")).to include(@other_task)
  end

  it "状態検索した場合、状態が含まれる検索結果を出す" do
    expect(Task.search_status(1)).to include(@other_task)
    expect(Task.search_status(1)).to_not include(@my_task)
  end
  
  it "タイトルと状態検索した場合、タイトルと状態が一致した検索結果を出す" do
    expect(Task.search_task_name("model").search_status(1)).to include(@other_task)
    expect(Task.search_task_name("model").search_status(1)).to_not include(@task)
    expect(Task.search_task_name("model").search_status(1)).to_not include(@my_task)
  end
end