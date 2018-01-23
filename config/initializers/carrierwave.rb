# require 'dropbox'

CarrierWave.configure do |config|
  config.dropbox_access_token = ENV["DROPBOX_ACCESS_TOKEN_FACOM"]
end
