require 'test_helper'

feature 'Dashboard' do
  setup do
    create_list(:post, 1, :with_contractor)
    Post.all.map(&:publish!)

    @post = Post.last
  end

  scenario 'lists all published posts' do
    visit root_path
    page.must_have_text 'Anuncie grátis no ShigotoDoko!'
    page.must_have_link 'Enviar anúncio'
  end

  scenario 'visiting a post' do
    visit root_path

    click_link @post.title

    page.must_have_text 'Auto-peças'
  end
end
