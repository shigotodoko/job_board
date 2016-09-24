require 'test_helper'

feature 'Sending a new job' do
  setup do
    create_list(:post, 1, :with_contractor)
    Post.all.map(&:publish!)

    visit root_path
    click_link 'Enviar anúncio'
  end

  scenario 'displaying new job form' do
    assert page.has_content?('Novo Anúncio')

    assert page.find_field('post_title')
    assert page.find_field('post_location')
    assert page.find_field('post_description')
    assert page.find_field('post_salary')
    assert page.find_field('post_shift')
    assert page.find_field('post_work_load')
    assert page.find_field('post_day_off')
    assert page.find_field('post_requirements')
    assert page.find_field('post_benefits')

    assert page.find_field('post_contractor_person_name')
    assert page.find_field('post_contractor_company_name')
    assert page.find_field('post_contractor_address')
    assert page.find_field('post_contractor_mail_address')
    assert page.find_field('post_contractor_phone_number')

    assert page.find_button('Enviar')
  end

  scenario 'filling all the fields correctly' do
    page.fill_in('post_title', with: 'Vagas para componentes eletronicos')
    page.fill_in('post_location', with: 'Aichi-ken, Toyohashi-shi')
    page.fill_in('post_description', with: 'Venha trabalhar conosco')
    page.fill_in('post_salary', with: '1300 ienes/hora')
    page.fill_in('post_shift', with: 'Diurno')
    page.fill_in('post_work_load', with: '08:00 às 17:00')
    page.fill_in('post_day_off', with: 'Sábados e domingos')
    page.fill_in('post_requirements', with: 'condução e moradia própria')
    page.fill_in('post_benefits', with: 'shakai hoken')

    page.fill_in('post_contractor_person_name', with: 'Akira')
    page.fill_in('post_contractor_company_name', with: 'ABC Company')
    page.fill_in('post_contractor_address', with: 'Aichi-ken')
    page.fill_in('post_contractor_mail_address', with: 'abc@company.jp')
    page.fill_in('post_contractor_phone_number', with: '11123456')

    page.click_button 'Enviar'

    assert page.has_content?('Obrigado por enviar um anúncio para o ShigotoDoko!')
  end
end
