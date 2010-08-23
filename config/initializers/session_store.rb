# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_puma_session',
  :secret      => '3c4d16a591dfc6a0764c5e2d13f1c6e9017eee2112933ffa1e4022e5a2bd8b5640c78b02efa559ca3a21a5afa1e3056cb7de6905113a83dfcd0d6fea4597b66e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
