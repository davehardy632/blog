require 'rails_helper'

describe "User sees all articles" do
  describe "When I visit /articles" do
    it "Displays all articles" do
      article_1 = Article.create!(title: "Article 1", body: "This is a really great article, well done.")
      article_2 = Article.create!(title: "Article 2", body: "This article sucked and I am a dumber person having read it.")
      article_3 = Article.create!(title: "Article 3", body: "This article was ok, I have conflicting opinions about it.")

      visit articles_path

    within("#article-#{article_1.id}") do
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
    within("#article-#{article_2.id}") do
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
    end
    within("#article-#{article_3.id}") do
      expect(page).to have_content(article_3.title)
      expect(page).to have_content(article_3.body)
    end
    end
  end
end
