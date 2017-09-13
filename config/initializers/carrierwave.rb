CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  if !Rails.env.test?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: "AKIAIE5CEH2UUVDESL3A",
      aws_secret_access_key: "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"
    }
    config.fog_directory  = "onblastphotos"
  end
end
