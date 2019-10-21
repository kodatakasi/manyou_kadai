require 'rails_helper'

RSpec.describe Label, type: :model do
  it "タイトルが空ならバリデーションが通らない" do
    label = Label.new(title: '')
    expect(label).not_to be_valid
  end

  it "タイトルが記載されていればバリデーションが通る" do
    label = Label.new(title: 'title')
    expect(label).to be_valid
  end
end
