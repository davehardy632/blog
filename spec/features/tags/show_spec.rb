require 'rails_helper'

describe "tag show page" do
  describe "when i visit tag_path" do
    it "there is a link to delete a tag" do
      tag = Tag.create!(name: "technology")
      article_1 = tag.articles.create!(title: "Sample article 1", body: "This is the body of sample article 1")
      article_2 = tag.articles.create!(title: "Sample article 2", body: "This is the body of sample article 2")

      visit tag_path(tag)

      expect(page).to have_content(tag.name)
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)

      click_link "Delete Tag"
    end
  end
end
