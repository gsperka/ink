OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '59153127909-mnmhvbg1fo3mttij2e93o4elv3hujmq8.apps.googleusercontent.com', '6yToFHILEARpRtHKgfbdGtYj', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

