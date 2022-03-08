class ApplicationMailer < ActionMailer::Base
  default from: 'fred@autos@email.com'
  layout 'mailer'
end
