require 'rails_helper'

RSpec.describe User, '#New'  do

  before(:each) do
    @user = User.new
  end

  scenario "should be valid" do
    @user.email = 'test@test.com'
    @user.password = 'password123'
    assert @user.valid?
  end

  scenario "email should be present" do
    @user.email = " "
    assert @user.valid?
  end

end
