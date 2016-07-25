require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = build(:post, :with_contractor)
  end

  test 'should belongs to a contractor' do
    assert_equal 'ABC Company', @post.contractor.name
  end

  test 'contractor_company_name attribute' do
    @post.contractor_company_name = 'some company'
    assert_equal 'some company', @post.contractor_company_name
  end

  test 'contractor_person_name attribute' do
    @post.contractor_person_name = 'akira'
    assert_equal 'akira', @post.contractor_person_name
  end

  test 'contractor_phone_number attribute' do
    @post.contractor_phone_number = '01020304'
    assert_equal '01020304', @post.contractor_phone_number
  end

  test 'contractor_mail_address attribute' do
    @post.contractor_mail_address = 'akira@company.jp'
    assert_equal 'akira@company.jp', @post.contractor_mail_address
  end

  test 'contractor_address attribute' do
    @post.contractor_address = 'aichi-ken'
    assert_equal 'aichi-ken', @post.contractor_address
  end

  test 'have ony contact' do
    @post.contact = Contact.new(name: 'shima')
    assert_equal 'shima', @post.contact.name
  end

  test 'title is filled' do
    @post.title = ''
    assert_not @post.valid?
  end

  test 'location is filled' do
    @post.location = ''
    assert_not @post.valid?
  end

  test 'description is filled' do
    @post.description = ''
    assert_not @post.valid?
  end

  test 'salary is filled' do
    @post.salary = ''
    assert_not @post.valid?
  end

  test 'shift is filled' do
    @post.shift = ''
    assert_not @post.valid?
  end

  test 'day_off is filled' do
    @post.day_off = ''
    assert_not @post.valid?
  end

  test 'work_load is filled' do
    @post.work_load = ''
    assert_not @post.valid?
  end

  test 'should allow publish without contractor_person_name attribute when admin' do
    post = build(:post, :with_contractor)

    post.publish

    assert_equal 'published', post.status
    assert_not_nil post.published_at
  end

  test 'change its status to expired' do
    post = build(:post, :with_contractor, status: :published)

    post.expire!

    assert_equal 'expired', post.status
  end

  test 'sets expired_at when expired' do
    post = build(:post, :with_contractor, status: :published)

    post.expire!

    assert_not_nil post.expired_at
  end

  test 'changes its status to archived' do
    post = build(:post, :with_contractor, status: :pending)

    post.archive

    assert_equal 'archived', post.status
  end

  test 'applies tags when publish' do
    post = build(:post, :with_contractor, status: :pending)

    post.publish

    assert_not_empty post.tag_list
    assert_includes post.tag_list, 'aichi-ken'
    assert_not_includes post.tag_list, 'shizuoka-ken'
  end
end
