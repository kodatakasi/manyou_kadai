FactoryBot.define do
  factory :label do
    title { "label01" }
  end

  factory :second_label, class: Label do
    title { "label02" }
  end
end
