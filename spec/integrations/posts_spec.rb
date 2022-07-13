require 'rails_helper'

RSpec.describe "Post tests", type: :feature do
  scenario "should have no access w/o authentication" do
    visit posts_path
    #sleep(5)
    expect(:redirect)
  end

  scenario "alert to post" do
    visit posts_path
    sleep(2)
    click_on "Войти"
    sleep(2)
    fill_in "user_email", with: "admin_1@test.com"
    fill_in "user_password", with: "password123"
    sleep(2)
    click_link("Войти", match: :first)
    sleep(2)
    expect(current_path).to eq posts_path
  end

  #post my_path, params: { name: 'd' }
  #expect(flash[:notice]).to match 'd created successfully'



end
