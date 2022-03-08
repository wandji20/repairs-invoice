class InvoiceMailer < ApplicationMailer
  def send_invoice(id)
    @invoice = Invoice.find(id)

    mail to: @invoice.email, subject: 'New Invoice'
  end
end
