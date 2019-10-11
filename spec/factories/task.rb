FactoryBot.define do

  factory :task do
    task_name { 'test_task_01' }
    memo { 'testtesttest' }
    end_time { '2019-10-3' }
    created_at { '2019-10-02 15:52:11'}
    priority { 'low' }
  end

  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    memo { 'mofmofmofmof' }
    end_time { '2019-10-2' }
    created_at { '2019-10-02 14:52:11'}
    priority { 'high' }
  end
end