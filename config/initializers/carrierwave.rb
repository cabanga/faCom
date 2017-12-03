require 'dropbox'

CarrierWave.configure do |config|
  dbx = Dropbox::Client.new(ENV['DROPBOX_ACCESS_TOKEN_FACOM'])

  puts "****************************************"
  p dbx

  if Rails.env.production?
    config.storage :dropbox
  else
    config.storage :file
  end
end
