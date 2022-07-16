require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context 'GET index' do
    it 'returns a success response' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'GET new' do
    it 'returns a success response' do
      # Mimic the router behavior of setting the Devise scope through the env.
      @request.env['devise.mapping'] = Devise.mappings[:user]

      # Use the sign_in helper to sign in a fixture `User` record.
      sign_in User.first

      get :new

      expect(response.status).to eq(200)
    end
  end


  context 'check post title' do
    let(:post) { Post.create(title: 'Test title', content: 'Test content') }
    it 'should be valid' do
      expect(post.valid?)
    end

    it 'should be valid' do
      expect(post.title).to eq('Test title')
    end

    it 'should be valid' do
      expect(post.content).to eq('Test content')
    end
  end
end







  # test "should get index with authentication" do
  #   user = users(:daily_user)

  #   get blog_posts_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_blog_post_url
  #   assert_response :success
  # end

  # test "should create blog_post" do
  #   assert_difference('BlogPost.count') do
  #     post blog_posts_url, params: { blog_post: { content: @blog_post.content, publish_date: @blog_post.publish_date, title: @blog_post.title } }
  #   end

  #   assert_redirected_to blog_post_url(BlogPost.last)
  # end

  # test "should show blog_post" do
  #   get blog_post_url(@blog_post)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_blog_post_url(@blog_post)
  #   assert_response :success
  # end

  # test "should update blog_post" do
  #   patch blog_post_url(@blog_post), params: { blog_post: { content: @blog_post.content, publish_date: @blog_post.publish_date, title: @blog_post.title } }
  #   assert_redirected_to blog_post_url(@blog_post)
  # end

  # test "should destroy blog_post" do
  #   assert_difference('BlogPost.count', -1) do
  #     delete blog_post_url(@blog_post)
  #   end

  #   assert_redirected_to blog_posts_url
  # ##end


