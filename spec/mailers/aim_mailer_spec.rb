require "rails_helper"

RSpec.describe AimMailer, type: :mailer do
  let(:aim) { FactoryBot.create(:aim, title: "テストmailer_spec", reason: "テスト") }

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == "text/plain; charset=UTF-8" }
    part.body.raw_source
  end

  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == "text/html; charset=UTF-8" }
    part.body.raw_source
  end

  describe "#creation_email" do
    let(:mail) { AimMailer.creation_email(aim) }

    it "想定通りのメールが生成されている" do
      # header
      expect(mail.subject).to eq("目標作成完了メール")
      expect(mail.to).to eq(["user@example.com"])
      expect(mail.from).to eq(["aim@example.com"])
      
      # text形式の本文
      expect(text_body).to match("以下の目標を作成しました。")
      expect(text_body).to match("テストmailer_spec")
      expect(text_body).to match("テスト")  

      # html形式の本文
      expect(html_body).to match("以下の目標を作成しました。")
      expect(html_body).to match("テストmailer_spec")
      expect(html_body).to match("テスト")
    end
  end  
end
