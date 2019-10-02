require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:task, task_name: 'test_task_10', memo: 'samplesamplesample')

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
    visit tasks_path
    click_link 'test_task_10'
    expect(page).to have_content 'samplesamplesample'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    all('tbody tr')[0].click_link 'test_task_10'
    expect(page).to have_content 'samplesamplesample'
  end
end