require 'rails_helper'

RSpec.describe 'Sign in', type: :feature do
  before(:each) do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'floatingInput', with: 'admin@test.com'
    fill_in 'floatingPassword', with: 'password123'
    click_on('Войти')
  end

  scenario 'Should expect link to add post' do
    expect(page).to have_content('Добавить публикацию')
  end

  scenario 'Should expect current path to add post' do
    click_on 'Добавить публикацию'
    expect(current_path).to eq('/posts/new')
  end

  scenario 'Creating post and render on main path' do
    click_on('Добавить публикацию')
    fill_in 'floatingTextarea2', with: 'Первая публикация'
    fill_in 'floatingTextarea1', with: 'Текст для первой публикации'
    click_on 'Сохранить'
    expect(page).to have_content('Первая публикация')
    visit posts_path
    expect(page).to have_content('Текст для первой публикации')
  end

  scenario 'invalid inputs' do
    click_on('Добавить публикацию')
    fill_in 'floatingTextarea2', with: ' '
    fill_in 'floatingTextarea1', with: ' '
    click_on 'Сохранить'
    expect(page).to have_content('Название не может быть пустым')
    expect(page).to have_content('Название недостаточной длины (не может быть меньше 5 символов)')
    expect(page).to have_content('Содержимое не может быть пустым')
    expect(page).to have_content('Содержимое недостаточной длины (не может быть меньше 5 символов)')
  end
end
