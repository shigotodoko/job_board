class ApplicationMailer < ActionMailer::Base
  default from: "klebershimabuku@gmail.com"
  layout 'mailer'

  ADMIN = default[:from]
end
