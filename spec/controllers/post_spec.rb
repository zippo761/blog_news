require  'rails_helper'

RSpec.describe PostsController, type:  :controller  do

  context "GET index" do
    it "returns a success response" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context "check post title" do
    let(:post) {Post.create(title: "Test title", content: "Test content")}
    it "should be valid" do
      expect(post.valid?)
    end

    it "should be valid" do
      expect(post.title).to eq('Test title')
    end

    it "should be valid" do
      expect(post.content).to eq('Test content')
    end
  end

end