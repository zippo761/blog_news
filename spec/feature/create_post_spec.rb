require 'rails_helper'

RSpec.describe 'Sign in', type: :feature do
  before(:each) do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: 'password123'
    click_on('Войти')
  end

  scenario 'Should expect link to add post' do
    expect(page).to have_content('Добавить пост')
  end

  scenario 'Should expect current path to add post' do
    expect(page).to have_content('Добавить пост')
    click_on 'Добавить пост'
    expect(current_path).to eq('/posts/new')
  end

  scenario 'Creating post and render on main path' do
    click_on('Добавить пост')
    fill_in 'post_title', with: 'Первый пост'
    fill_in 'post_content', with: 'Текст для первого поста'
    click_on 'Сохранить'
    expect(page).to have_content('Первый пост')
    visit posts_path
    expect(page).to have_content('Первый пост')
  end

  scenario 'invalid inputs' do
    click_on('Добавить пост')
    fill_in 'post_title', with: ' '
    fill_in 'post_content', with: ' '
    click_on 'Сохранить'
    expect(page).to have_content('Название не может быть пустым')
    expect(page).to have_content('Название недостаточной длины (не может быть меньше 5 символов)')
    expect(page).to have_content('Содержимое не может быть пустым')
    expect(page).to have_content('Содержимое недостаточной длины (не может быть меньше 5 символов)')
  end
end
