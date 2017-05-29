CarrierWave.configure do |config|
  config.dropbox_app_key = "01pk7m6ugz55uhv"
  config.dropbox_app_secret = "abvmdkkdmo4cb8i"
  config.dropbox_access_token = "swv3ix53qkyn0szj"
  config.dropbox_access_token_secret = "b7075awytodqy6n"
  config.dropbox_user_id = "659914788"
  config.dropbox_access_type = "app_folder"

  if Rails.env.production?
    config.storage :dropbox
  else
    config.storage :file
  end
end
