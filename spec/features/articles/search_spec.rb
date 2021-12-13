require 'rails_helper'

feature "Searching articles" do
    background do
      User.create(email: 'user@example.com', password: 'caplin')
      Article.create(title: "Title One", content: "Content One")
      Article.create(title: "Title One Plus", content: "Content One Plus")
      Article.create(title: "Title Two", content: "Content Two")
      Article.create(title: "Title Three", content: "Content Three")

      visit '/'
      within("#session") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'caplin'
      end
      click_button 'Log in'
    end
  
    scenario "Search for articles by title successfully" do
        expect(page).to have_content "One"

        fill_in 'Search', with: "one"
        click_button 'Search'

        expect(page).to have_content "Title One"
        expect(page).to have_content "Title One Plus"
        expect(page).to have_no_content "Two"
        expect(page).to have_no_content "Three"

        fill_in 'Search', with: 'title'
        click_button 'Search'

        expect(page).to have_content "Title One"
        expect(page).to have_content "Title One Plus"
        expect(page).to have_content "Title Two"
        expect(page).to have_content "Title Three"
    end

    scenario "Search for articles by title with no results" do
        expect(page).to have_content "One"

        fill_in 'Search', with: "Four"
        click_button 'Search'

        expect(page).to have_content "No results"
    end
end