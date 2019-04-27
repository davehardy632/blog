require "rails_helper"

describe Article, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
  end
  describe "relationships" do
    it {should have_many(:comments)}
  end
  describe 'instance methods' do
    describe '#tag_list' do
      it 'turns associated tags into strings' do
        article = Article.create(title: "Game of Thrones Review", body: "Every single character on the show is going to die in the end.")
        article.tags.create(name: "television")
        article.tags.create(name: "popular")

        expect(article.tag_list).to eq("television, popular")
      end
    end
  end
end
