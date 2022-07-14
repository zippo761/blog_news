require 'rails_helper'

RSpec.describe "Sign in", type: :feature do
  before(:each) do
    visit posts_path
    click_on "Логин"
    fill_in "user_email", with: "admin_1@test.com"
    fill_in "user_password", with: "password123"
    click_on("Войти")
    click_on("Добавить пост")
    fill_in 'post_title', with: "Первый пост"
    fill_in 'post_content', with: "Текст для первого поста"
    click_on 'Сохранить'
  end

  scenario "Update post" do
    click_on "Редактировать"
    expect(current_path).to eq('/posts/1/edit')
  end

end

