FactoryBot.define do

  factory :task do
    task_name { 'test_task_01' }
    memo { 'testtesttest' }
  end

  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    memo { 'mofmofmofmof' }
  end
end