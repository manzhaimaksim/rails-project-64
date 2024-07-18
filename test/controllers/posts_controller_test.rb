# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)

    @attrs = {
      title: Faker::Artist.name,
      body: Faker::Movies::HarryPotter.quote,
      category_id: @category.id
    }
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_post_url(@user)
    assert_response :success
  end

  test 'should create post' do
    post user_posts_url(@user), params: { post: @attrs }

    post = Post.find_by @attrs

    assert { post }
    assert_redirected_to post_url(post)
  end
end
