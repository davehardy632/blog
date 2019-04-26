require 'rails_helper'

describe "User sees all articles" do
  describe "When I visit /articles" do
    it "Displays all articles" do
      article_1 = Article.create!(title: "Article 1", body: "This is a really great article, well done.")
      article_2 = Article.create!(title: "Article 2", body: "This article sucked and I am a dumber person having read it.")
      article_3 = Article.create!(title: "Article 3", body: "This article was ok, I have conflicting opinions about it.")

      visit articles_path

    within("#article-#{article_1.id}") do
      expect(page).to have_link(article_1.title)
    end
    within("#article-#{article_2.id}") do
      expect(page).to have_link(article_2.title)
    end
    within("#article-#{article_3.id}") do
      expect(page).to have_link(article_3.title)
    end
    end
    it "Article titles are links to article show page" do
      article_1 = Article.create!(title: "Article 1", body: "This is a really great article, well done.")
      article_2 = Article.create!(title: "Article 2", body: "This article sucked and I am a dumber person having read it.")
      article_3 = Article.create!(title: "Article 3", body: "This article was ok, I have conflicting opinions about it.")

      visit articles_path

      within("#article-#{article_1.id}") do
        click_link(article_1.title)
      end
      expect(current_path).to eq(article_path(article_1))
    end
    it "There is a link to create a new article" do
       visit articles_path

       expect(page).to have_link("Create New Article")
       click_link("Create New Article")

       expect(current_path).to eq(new_article_path)
    end
  end
end
