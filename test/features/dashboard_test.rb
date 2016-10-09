require 'test_helper'

feature 'Dashboard' do
  setup do
    create(:post, :pending, :with_contractor, title: 'Auto-peças')
    create(:post, :pending, :with_contractor, title: 'Kiban')
    Post.first.publish!
    @post = Post.first
  end

  scenario 'lists all published posts' do
    visit root_path
    page.must_have_text 'Anuncie grátis no ShigotoDoko!'
    page.must_have_link 'Enviar anúncio'
    page.must_have_link @post.title
    page.wont_have_link 'Kiban'
  end

  scenario 'visiting a post' do
    visit root_path

    click_link @post.title

    page.must_have_text @post.title
  end
end
