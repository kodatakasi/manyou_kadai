require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:task, task_name: 'test_task_10',
                                  memo: 'samplesamplesample', 
                              end_time: '2019-10-5', 
                            created_at: '2019-10-02 13:52:11',
                      )

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

  scenario "タスクが終了期限の降順に並んでいるかのテスト" do
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[0].click_link 'test_task_02'
    expect(page).to have_content '2019-10-02'
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[1].click_link 'test_task_01'
    expect(page).to have_content '2019-10-03'
    visit tasks_path
    click_link "終了期限でソートする"
    all('tbody tr')[2].click_link 'test_task_10'
    expect(page).to have_content '2019-10-05'
  end
end