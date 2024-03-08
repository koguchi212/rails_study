class AimMailer < ApplicationMailer
  def creation_email(aim)
    @aim = aim
    mail(
        subject: "目標作成完了メール",
        to: "user@example.com",
        from: "aim@example.com"
    )
  end
end
