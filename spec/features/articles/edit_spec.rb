require 'rails_helper'

describe "User can edit an article" do
  describe "When I visit an article show page" do
    it "There is a link to edit an article" do
      article = Article.create!(title: "Article needs editing", body: "This is the body of the article I will be editing")

      visit article_path(article)

      click_link "Edit Article"
      expect(current_path).to eq(edit_article_path(article))

      expect(page).to have_field("article[title]", placeholder: article.title)
      expect(page).to have_field("article[body]", placeholder: article.body)
      fill_in "article[body]", with: "This is the newly edited body of the article."
      click_on "Update Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content(article.title)
      expect(page).to have_content("This is the newly edited body of the article.")
    end
  end
end
