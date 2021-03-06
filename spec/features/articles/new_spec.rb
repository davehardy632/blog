require 'rails_helper'

describe "User creates new article" do
  describe "They link from articles index" do
    it "they fill in title and body" do

      visit articles_path

      click_link("Create New Article")

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: "New Article"
      fill_in 'article[body]', with: "This is the body of the new article I am currently writing, it will go down is histroy as the best article ever written."
      fill_in 'article[tag_list]', with: 'ruby, technology'
      click_on "Create Article"

      expect(page).to have_content("Article New Article has been Created")
      expect(page).to have_content("New Article")
      expect(page).to have_content("This is the body of the new article I am currently writing, it will go down is histroy as the best article ever written.")
      expect(page).to have_content("ruby")
      expect(page).to have_content("technology")
    end
  end
end
