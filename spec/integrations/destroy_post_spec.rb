require 'rails_helper'

RSpec.describe "Update post", type: :feature do
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

  scenario "Should expect link destroy post" do
    expect(page).to have_content('Удалить пост')
  end

  scenario "Should expect destroy post" do
    page.accept_confirm do
      click_on "Удалить пост", match: :first
    end
    expect(page).to have_content('Пост удалён')
  end

end

