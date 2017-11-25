require 'jwt'

module Auth
  class << self
    def encode(payload)
      JWT.encode payload, secret_key, algorithm 
    end

    def decode(token)
      begin 
        JWT.decode token, secret_key, true, { algorithm: algorithm }
      rescue 
        nil
      end
    end

    def secret_key
      Rails.application.secrets.secret_key_base
    end

    def algorithm
      'HS256'
    end
  end
end
