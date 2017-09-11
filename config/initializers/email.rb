if Rails.env.development?
  ApplicationMailer.delivery_method = :smtp
  ApplicationMailer.smtp_settings= { address: "localhost", port: 1025 }
end
