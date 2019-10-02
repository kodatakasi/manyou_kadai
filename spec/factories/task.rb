FactoryBot.define do

  factory :task do
    task_name { 'test_task_01' }
    memo { 'testtesttest' }
    created_at { '2019-10-02 15:52:11'}
  end

  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    memo { 'mofmofmofmof' }
    created_at { '2019-10-02 14:52:11'}    
  end
end