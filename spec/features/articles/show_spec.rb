require 'rails_helper'

describe "Article show page" do
  describe "When I visit article_path(article)" do
    it "I see article title and body, and a link back to index page" do
      article = Article.create!(title: 'Sample Article', body: 'This is the body of my sample article and it is thoughtful and well written.')

      visit article_path(article)

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_link("Back to Articles list")

      click_link("Back to Articles list")

      expect(current_path).to eq(articles_path)
    end
    it "Shows all comments for each article" do
      article = Article.create!(title: "Game of Thrones Review", body: "All characters are going to die, its sad.")
      comment_1 = article.comments.create(author_name: "John Snow", body: "Winter is coming.")
      comment_2 = article.comments.create(author_name: "Arya Stark", body: "This is my sword, needle.")

      visit articles_path

      click_link article.title
      expect(current_path).to eq(article_path(article))

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
    it "They fill in a comment form" do
      article = Article.create(title: "Game of Thrones Review", body: "Everyone on the show is going to die")

      visit article_path(article)

      fill_in 'comment[author_name]', with: "John Snow"
      fill_in 'comment[body]', with: "Winter is coming, I am a man of the nights watch."
      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("John Snow")
      expect(page).to have_content("Winter is coming, I am a man of the nights watch.")
    end
    it "tag names are links to tag show page" do
      article = Article.create!(title: "Game of Thrones Review", body: "Every character on the show will die")
      tag = article.tags.create!(name: "television")

    end
  end
end
