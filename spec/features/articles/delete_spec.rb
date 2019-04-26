require 'rails_helper'

describe 'User can delete an article' do
  describe 'When they visit article show page' do
    it 'displays all articles except the deleted one' do
      article_1 = Article.create!(title: "Article 1", body: "This is the body of article 1, made for testing delete action.")
      article_2 = Article.create!(title: "Article 2", body: "This is the second article that will soon be deleted, how unfortunate.")

      visit article_path(article_2)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_1.title)
      expect(page).to_not have_content(article_2.title)
    end
  end
end
