class MarvelResource
  include HTTParty
  format :json

  base_uri "http://gateway.marvel.com/v1/public"

  def self.req_params
    req_time = Time.now
    public_key = Rails.application.secrets.api_key
    { apikey: public_key,
      ts: req_time,
      hash: Digest::MD5.hexdigest("#{req_time}#{private_key}#{public_key}")
    }
  end 

  private

  #TODO - horribly insecure
  def self.private_key
    'a25fb10c3f5bc0ac6b4ba423e30e087a4450bff0'
  end

end
    
