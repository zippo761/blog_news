require 'rails_helper'

RSpec.describe 'Update post', type: :feature do
  before(:each) do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'floatingInput', with: 'admin@test.com'
    fill_in 'floatingPassword', with: 'password123'
    click_on('Войти')
    click_on('Добавить публикацию')
    fill_in 'floatingTextarea2', with: 'Первая публикация'
    fill_in 'floatingTextarea1', with: 'Текст для первой публикации'
    click_on 'Сохранить'
  end

  scenario 'Should have eq update post' do
    click_on 'Редактировать'
    expect(page).to have_content('Редактирование публикации')
  end

  scenario 'Should have current path edit post' do
    click_on 'Редактировать'
    expect(current_path).to eq('/posts/1/edit')
  end
end
