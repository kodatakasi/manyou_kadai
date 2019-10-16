require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do
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

  scenario "新しいユーザーでサインアップが出来る。同時にログインする。" do
    click_link 'ログアウト'
    visit new_user_path
    fill_in 'name', with: "test_user"
    fill_in 'email', with: "a@example.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "password"
    click_button "アカウント登録する"
    expect(page).to have_content 'test_user'
    expect(page).to have_content 'a@example.com'
  end

  scenario "ログインが出来る" do
    visit login_path
    fill_in "session_email", with: "test1@example.com"
    fill_in "session_password", with: "passwordpassword"
    click_button "ログインする"
    expect(page).to have_content 'ログインしました。'
  end

  scenario "ログアウトが出来る" do
    click_link 'ログアウト'    
    expect(page).to have_content 'ログアウトしました。'
  end

  scenario "ログインしていない場合、タスクページに飛ぼうとした場合、ログインページに遷移する" do
    click_link 'ログアウト'
    visit tasks_path
    expect(page).to_not have_content 'タスク一覧'
    expect(page).to have_button 'ログインする'
  end

  scenario "他人がログインした場合、自分の作成したタスクは表示しない" do
    visit login_path
    fill_in "session_email", with: "test2@example.com"
    fill_in "session_password", with: "password02"
    click_button "ログインする"
    expect(page).to_not have_content 'test_task_01'
    expect(page).to_not have_content 'test_task_02'
    expect(page).to_not have_content 'test_task_10'
  end

  scenario "自分が作成したタスクだけを表示する" do
    visit tasks_path
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'test_task_02'
    expect(page).to have_content 'test_task_10'
  end

  scenario "自分以外のユーザーのマイページにいかなせない" do
    user = FactoryBot.create(:another_user)
    visit user_path(user)
    expect(page).to_not have_content 'test1@example.com'
  end

  scenario "管理者権限のあるユーザーは、ユーザーを登録できる" do
    click_link 'ユーザー一覧'
    click_link '新規登録'
    expect(page).to have_button 'アカウント登録する'
  end

  scenario "管理者権限のあるユーザーは、ユーザー情報を更新できる" do
    click_link 'ユーザー一覧'
    click_link 'テストユーザー２'
    click_link '編集'
    expect(page).to have_content 'ユーザーの編集'
    expect(page).to have_button 'アカウント登録する'
  end

  scenario "管理者権限のあるユーザーは、ユーザーを削除できる" do
    click_link 'ユーザー一覧'
    click_link 'テストユーザー２'
    click_link '削除'    
    expect(page).to have_content 'ユーザーを削除しました。'
  end

  scenario "管理者権限のあるユーザーでログインすると、ユーザー一覧が表示される" do
    click_link 'ユーザー一覧'
    expect(page).to have_content 'テストユーザー'
    expect(page).to have_content 'テストユーザー２'
  end

  scenario "管理者権限のあるユーザーでログインすると、ユーザーの詳細が表示される" do
    click_link 'ユーザー一覧'
    click_link 'テストユーザー２'
    expect(page).to have_content 'ユーザーの詳細'
  end
end