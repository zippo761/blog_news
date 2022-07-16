require 'rails_helper'

RSpec.describe 'Update post', type: :feature do
  before(:each) do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'user_email', with: 'admin@test.com'
    fill_in 'user_password', with: 'password123'
    click_on('Войти')
    click_on('Добавить пост')
    fill_in 'post_title', with: 'Первый пост'
    fill_in 'post_content', with: 'Текст для первого поста'
    click_on 'Сохранить'
  end

  scenario 'Should have eq update post' do
    click_on 'Редактировать'
    expect(page).to have_content('Редактирование поста')
  end

  scenario 'Should have current path edit post' do
    click_on 'Редактировать'
    expect(current_path).to eq('/posts/1/edit')
  end
end
