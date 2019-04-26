require 'rails_helper'

describe "Article show page" do
  describe "When I visit article_path(article)" do
    it "I see article title and body" do
      article = Article.create!(title: 'Sample Article', body: 'This is the body of my sample article and it is thoughtful and well written.')

      visit article_path(article)

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
