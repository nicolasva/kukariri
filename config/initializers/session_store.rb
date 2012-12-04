# Be sure to restart your server when you modify this file.

Kukariri::Application.config.session_store :cookie_store, key: '_kukariri_session'

Rails.application.config.middleware.insert_before(
  ActionDispatch::Session::CookieStore,
  FlashSessionCookieMiddleware,
  Rails.application.config.session_options[:key]
)

#Kukariri::Application.config.session_store :active_record_store

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Kukariri::Application.config.session_store :active_record_store
