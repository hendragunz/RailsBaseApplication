# Be sure to restart your server when you modify this file.

RailsBaseApplication::Application.config.session_store :cookie_store, key: '_RailsBaseApplication_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# RailsBaseApplication::Application.config.session_store :active_record_store

RailsBaseApplication::Application.config.secret_token = '61cb709f424eee5a215e131af5fb269b'