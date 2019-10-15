require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    user_a = FactoryBot.create(:user)
    user_b = FactoryBot.create(:second_user)
    FactoryBot.create(:task, user: user_a)
    FactoryBot.create(:second_task, user: user_a)
    FactoryBot.create(:third_task, user: user_a)

    visit login_path
    fill_in "session_email", with: "test1@example.com"
    fill_in "session_password", with: "passwordpassword"
    click_button "ログインする"
  end

  scenario "新しいユーザーのサインアップのテスト" do
    click_link 'ログアウト'
    visit new_user_path
    fill_in 'name', with: "test_user"
    fill_in 'email', with: "a@example.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "password"
    click_button "アカウント登録する"
    expect(page).to have_content 'test_user'
  end

  scenario "ログイン機能のテスト" do
    visit login_path
    fill_in "session_email", with: "test1@example.com"
    fill_in "session_password", with: "passwordpassword"
    click_button "ログインする"
    expect(page).to have_content 'ログインしました。'
  end

  scenario "ログインしていない場合、タスクページに飛ぼうとした場合、ログインページに遷移するテスト" do
    click_link 'ログアウト'
    visit tasks_path
    expect(page).to_not have_content 'タスク一覧'
    expect(page).to have_button 'ログインする'
  end

  scenario "他人がログインした場合、自分のタスクは表示しないテスト" do
    visit login_path
    fill_in "session_email", with: "test2@example.com"
    fill_in "session_password", with: "password02"
    click_button "ログインする"
    expect(page).to_not have_content 'test_task_01'
    expect(page).to_not have_content 'test_task_02'
    expect(page).to_not have_content 'test_task_10'
  end

  scenario "自分以外のユーザーのマイページにいかなせないテスト" do
    user = FactoryBot.create(:another_user)
    visit user_path(user)
    save_and_open_page
    expect(page).to_not have_content 'test1@example.com'
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'test_task_02'
    expect(page).to have_content 'test_task_10'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task_name', with: 'test_task_05'
    fill_in 'memo', with: 'testkakimasita'

    select'2019', from: 'task[end_time(1i)]'
    select'10', from: 'task[end_time(2i)]'
    select'10', from: 'task[end_time(3i)]'

    click_on '登録する'
    visit tasks_path
    expect(page).to have_content 'test_task_05'
    expect(page).to have_content '2019-10-10'
  end

  scenario "タスク詳細のテスト" do
    visit tasks_path
    click_link 'test_task_10'
    expect(page).to have_content 'samplesamplesample'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    all('tbody tr')[0].click_link 'test_task_01'
    expect(page).to have_content 'testtesttest'
    visit tasks_path
    all('tbody tr')[1].click_link 'test_task_02'
    expect(page).to have_content 'mofmofmofmof'
    visit tasks_path
    all('tbody tr')[2].click_link 'test_task_10'
    expect(page).to have_content 'samplesamplesample'
  end

  scenario "終了期限でソートした時、タスクが終了期限の降順に並んでいるかのテスト" do
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[0].click_link 'test_task_10'
    expect(page).to have_content '2019-10-05'
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[1].click_link 'test_task_01'
    expect(page).to have_content '2019-10-03'
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[2].click_link 'test_task_02'
    expect(page).to have_content '2019-10-02'
  end

  scenario "優先度でソートした時、タスクが優先度順に並んでいるかのテスト" do
    visit tasks_path
    click_link "優先度でソートする"
    all('tbody tr')[0].click_link 'test_task_02'
    expect(page).to have_content '高'
    visit tasks_path
    click_link "優先度でソートする"
    all('tbody tr')[1].click_link 'test_task_10'
    expect(page).to have_content '中'
    visit tasks_path
    click_link "優先度でソートする"
    all('tbody tr')[2].click_link 'test_task_01'
    expect(page).to have_content '低'
  end
end