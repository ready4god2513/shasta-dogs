CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => "AKIAIOLK4SPHUA47ADMA",
    :aws_secret_access_key  => "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",
  }
  config.fog_directory  = "shasta-dogs-#{::Rails.env}"
  config.fog_attributes = {"Cache-Control"=>"max-age=315576000"}
end