require 'rails_helper'

RSpec.describe 'test authorisation', type: :feature do
  scenario 'should have access with auth' do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'floatingInput', with: 'admin@test.com'
    fill_in 'floatingPassword', with: 'password123'
    click_on('Войти')
    expect(page).to have_content('Вход в систему выполнен')
  end

  scenario 'should have no access with wrong auth' do
    visit posts_path
    click_on 'Авторизация'
    fill_in 'floatingInput', with: 'wrong email'
    fill_in 'floatingPassword', with: 'wrong password'
    click_on('Войти')
    expect(page).not_to have_content('Вход в систему выполнен')
  end

  scenario 'should have no access to add post w/o auth' do
    visit new_post_path
    expect(page).to have_content('Вам необходимо войти в систему или зарегистрироваться')
  end

  scenario 'should have no access to read users w/o auth' do
    visit users_path
    expect(page).to have_content('Вам необходимо войти в систему или зарегистрироваться')
  end

  scenario 'should have no access to edit user setting w/o auth' do
    visit edit_user_registration_path
    expect(page).to have_content('Вам необходимо войти в систему или зарегистрироваться')
  end

  scenario 'should have no access to read users w/o auth' do
    visit edit_user_registration_path
    expect(page).to have_content('Вам необходимо войти в систему или зарегистрироваться')
  end
end
