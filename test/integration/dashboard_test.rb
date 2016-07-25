require 'test_helper'

class DashBoardTest < ActionDispatch::IntegrationTest
  setup do
    @posts = create_list(:post, 3, :with_contractor)
    @posts.map(&:publish!)
  end

  test 'visiting the home page' do
    get '/'
    assert_response :success
    assert_select 'a', 'Auto-peças'
    assert_select 'small', 'Anuncie grátis no ShigotoDoko!'
  end

  context 'visiting a job post' do
    setup do
      @post = @posts.last
      get "/posts/#{@post.id}"
    end

    should 'be success' do
      assert_response :success
    end

    should 'have title' do
      assert_select 'h1', @post.title
    end

    should 'have location' do
      assert_select 'h2', @post.location
    end

    should 'have description' do
      assert_select 'p', @post.description
    end

    should 'have requirements' do
      assert_select 'p', @post.requirements
    end

    should 'have benefits' do
      assert_select 'p', @post.benefits
    end

    should 'have salary' do
      assert_select 'p', @post.salary
    end

    should 'have work load' do
      assert_select 'p', @post.work_load
    end

    should 'have shift' do
      assert_select 'p', @post.shift
    end

    should 'have day off' do
      assert_select 'p', @post.day_off
    end

    should 'have a contractor details' do
      assert_select 'h1', @post.contractor.name
      assert_select 'a', @post.contractor.phone_number
      assert_select 'a', @post.contractor.mail_address
    end
  end
end
