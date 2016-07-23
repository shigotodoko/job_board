# encoding: utf-8
# Users
User.create(email: 'klebershimabuku@gmail.com', password: '123mudar', password_confirmation: '123mudar')
# Contractors
Contractor.destroy_all
Post.destroy_all

agekke = Contractor.create(name: 'Agekke Co., Ltd',
                           info: 'Tel: 048-648-2888',
                           address: 'Aichi-ken Toyohashi-shi 123',
                           phone_number: '0120-111-222',
                           mail_address: 'agekke@mailinator.com')

(1..30).each do |c|
  post = Post.new(title: "Anuncio Teste ##{c}",
               description: 'anything',
               location: 'Shizuoka-ken, Hamamatsu-shi',
               contractor: agekke,
               requirements: 'maior de idade',
               salary: '1000 ienes',
               work_load: 'das 7 as 17h',
               shift: 'Diurno',
               day_off: 'Acabou')

  puts("Criando anuncio: #{post.title}")
  if post.save(context: :admin)
    puts("Anuncio criado.")
    post.publish!
    puts("Anuncio publicado.")
  else
    post.errors
  end
end
