require 'rails_helper'

describe "From a tag show page" do
  describe "when i click Delete Tag" do
    it "tag is deleted from tag index page" do
      tag = Tag.create!(name: "technology")
      tag_2 = Tag.create!(name: 'science')
      article_1 = tag.articles.create!(title: "Sample article 1", body: "This is the body of sample article 1")
      article_2 = tag.articles.create!(title: "Sample article 2", body: "This is the body of sample article 2")

      visit tag_path(tag)

      click_link "Delete Tag"
      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(page).to_not have_content(tag.name)
    end
  end
end
