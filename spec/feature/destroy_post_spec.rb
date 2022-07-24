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

  xit 'Should expect destroy post but split this test because need setting for :selenium chrome' do
    page.accept_confirm do
      click_on 'Удалить'
    end
    expect(page).to have_content('Публикация была удалена')
  end
end
