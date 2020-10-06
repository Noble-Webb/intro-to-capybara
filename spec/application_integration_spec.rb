require 'spec_helper'
#We want to have a test that checks that the 
#get '/'route brings the user to that page.

#Our test is telling Capybara to visit the / URL. 
#It then sets the expectation that the body of the page 
#returned should include at least the text Welcome!
describe "GET '/' - Greeting Form" do
  # Code from previous example
  it 'welcomes the user' do
    visit '/' #navigates the test's browser to a specific url
    #to test the '/' root URL, we say visit '/'
    expect(page.body).to include("Welcome!") #page exposes the browser in use when testing
    #gives a Capybara::Session object that represents the user's browser view
    #The page.body method will dump out all of the HTML in the current page as a string.
  end

  # New test
  it 'has a greeting form with a user_name field' do
    visit '/'

    expect(page).to have_selector("form")
    #does it have an html with a form selector?
    expect(page).to have_field(:user_name)
    #does it have a user_name field
  end
end

#test is trying to mimic what a user should see when 
#they visit the greeting form, fill in the name 'Avi',
# and click the 'Submit' button.

describe "POST '/greet' - User Greeting" do
  it 'greets the user personally based on their user_name in the form' do
    visit '/'
    #loads the form into the page object.
    fill_in(:user_name, :with => "Avi")
    #use the Capybara method fill_in to input field user_name with 'Avi'.
    click_button "Submit"
    #submits the form
    expect(page).to have_text("Hi Avi, nice to meet you!")
  end
end