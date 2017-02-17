require 'rails_helper'

describe "the add a user process" do

  it "adds a new picture" do
    user = create(:user)
    visit 'pictures#index'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Profile'
    click_on 'Add a Picture'
    fill_in 'picture[title]', with: 'Moon'
    fill_in 'picture[description]', with: 'description'
    fill_in 'picture[description]', with: 'URL'
    page.attach_file('picture[local_pic]', Rails.root + 'app/assets/images/pic5.jpg')
    click_on 'Create Picture'
    expect(page).to have_content 'Moon'
  end


end
