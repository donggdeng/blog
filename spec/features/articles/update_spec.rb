require 'rails_helper'

feature "Updating article" do
    background do
      User.create(email: 'user@example.com', password: 'caplin')
      Article.create(title: "Title One", content: "Content One")

      visit '/'
      within("#session") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'caplin'
      end
      click_button 'Log in'
    end
  
    scenario "Login and successfully update article" do
      within(".articles") do
        click_link 'Title One'
      end

      expect(page).to have_content "Edit"
      expect(page).to have_content "Content One"

      within(".article") do
        click_link "Edit"
      end

      expect(page).to have_content "Editing Article"
      
      fill_in "Title", with: "New Title"

      click_button "Update Article"

      expect(page).to have_content "success"
      expect(page).to have_content "New Title"
    end
end