require "rails_helper"

RSpec.describe InvoiceMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:part) { create(:part) }
  let(:invoice_item) { build(:invoice_item, part_id: 1, quantity: 2) }
  let(:invoice) { 
    create(
      :invoice, name: user.username, email: user.email, 
      invoice_items_attributes: [{ part_id: part.id, quantity: 2}] )
  }
  
  describe "send_invoice" do
    let(:mail) { InvoiceMailer.send_invoice(invoice.id) }

    it "renders the headers" do
      expect(mail.subject).to eq("New Invoice")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq("fred@autos@email.com")
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi #{user.username}")
      expect(mail.body.encoded).to match("#{invoice.grand_total}")
    end
  end

end
