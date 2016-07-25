class Mailer < ApplicationMailer

  def notify(params)
    @title = params[:title]
    @location = params[:location]
    @salary = params[:salary]
    @shift = params[:shift]
    @day_off = params[:day_off]
    @description = params[:description]
    @requirements = params[:requirements]
    @benefits = params[:benefits]
    @work_load = params[:work_load]

    @contractor_person_name = params[:contractor_person_name]
    @contractor_company_name = params[:contractor_company_name]
    @contractor_address = params[:contractor_address]
    @contractor_mail = params[:contractor_mail_address]
    @contractor_phone = params[:contractor_phone_number]

    mail(to: 'klebershimabuku@gmail.com', subject: 'mensagem via web')
  end

  def expired(post)
    @post = post
    @post.contractor = post.contractor

    mail(to: 'klebershimabuku@gmail.com',
         subject: "[Shigotodoko] Anúncio expirado automaticamente - #{@post.title}")
  end
end
