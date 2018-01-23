# require 'dropbox'

CarrierWave.configure do |config|
  # dbx = Dropbox::Client.new(ENV['DROPBOX_ACCESS_TOKEN_FACOM'])
  # config.dropbox_access_token = Rails.application.dropbox_access_token
  config.dropbox_access_token = ENV["DROPBOX_ACCESS_TOKEN_FACOM"]

  # if Rails.env.production?
  #   config.storage :dropbox
  # else
  #   config.storage :file
  # end
end

# rake dropbox:authorize APP_KEY="p65sxomk7nf71u7" APP_SECRET="z9dsv75a4phd3zj" ACCESS_TYPE=dropbox|app_folder
#
# rake Dropbox:authorize APP_KEY="p65sxomk7nf71u7" APP_SECRET="z9dsv75a4phd3zj" ACCESS_TYPE=Dropbox|app_folder
