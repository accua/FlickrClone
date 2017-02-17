require 'rails_helper'

describe "the add a user process" do
  it "tell you to login when first going to the site" do
    visit 'pictures#index'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  it "adds a new user" do
    visit 'pictures#index'
    click_link 'Sign up'
    fill_in 'Email', :with => 'new_user@test.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end


  it "gives error when no email is entered" do
    visit 'pictures#index'
    click_link 'Sign up'
    click_on 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
