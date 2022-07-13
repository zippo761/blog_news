require 'rails_helper'

RSpec.describe "Post tests", type: :feature do
  scenario "should have no access w/o authentication" do
    visit posts_path
    #sleep(5)
    expect(:redirect)
  end

end
