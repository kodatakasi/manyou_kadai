require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する

    # backgroundの中に記載された記述は、そのカテゴリ内（feature "タスク管理機能", type: :feature do から endまでの内部）
    # に存在する全ての処理内（scenario内）で実行される
    # （「タスク一覧のテスト」でも「タスクが作成日時の降順に並んでいるかのテスト」でも、background内のコードが実行される）
    Task.create!(task_name: 'test_task_01', memo: 'testtesttest')
    Task.create!(task_name: 'test_task_02', memo: 'mofmofmofmof')
  end

  scenario "タスク一覧のテスト" do

    visit tasks_path

    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'test_task_02'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'memo', with: 'testkakimasita'

    click_on '登録する'

    visit tasks_path

    expect(page).to have_content 'test_task_05'

  end

  scenario "タスク詳細のテスト" do
    Task.create!(task_name: 'test_task_10', memo: 'samplesamplesample')

    visit tasks_path

    click_link 'test_task_10'

    expect(page).to have_content 'samplesamplesample'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    # ここにテスト内容を記載する
  end
end