require 'rails_helper'

describe "tag index page" do
  describe "When I visit /tags" do
    it "displays all tags" do
      tag_1 = Tag.create!(name: "technology")
      tag_2 = Tag.create!(name: "math")
      tag_3 = Tag.create!(name: "science")

      visit tags_path

      expect(page).to have_content(tag_1.name)
      expect(page).to have_content(tag_2.name)
      expect(page).to have_content(tag_3.name)
    end
  end
end
