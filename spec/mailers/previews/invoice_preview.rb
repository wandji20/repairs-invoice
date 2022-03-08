# Preview all emails at http://localhost:3000/rails/mailers/invoice
class InvoicePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invoice/send_invoice
  def send_invoice
    id = Invoice.last.id
    InvoiceMailer.send_invoice(id)
  end

end
