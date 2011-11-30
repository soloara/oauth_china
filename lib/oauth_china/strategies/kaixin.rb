module OauthChina
  class Kaixin < OauthChina::OAuth

    def initialize(*args)
      self.consumer_options = {
        :site               => 'http://api.kaixin001.com',
        :request_token_path => '/oauth/request_token',
        :access_token_path  => '/oauth/access_token',
        :authorize_path     => '/oauth/authorize',
        :realm              => url,
        :nonce              => nonce
      }
      super(*args)
    end

    def name
      :kaixin
    end

    #开心的nonce值必须32位随机字符串啊！
    def nonce
      Base64.encode64(OpenSSL::Random.random_bytes(32)).gsub(/\W/, '')[0, 32]
    end

    def authorized?
      #TODO
    end

    def destroy
      #TODO
    end

    def add_status(content, options = {})
      options.merge!(:content => content)
      self.post("http://api.kaixin001.com/records/add.json", options)
    end

    def upload_image(content, image_path, options = {})
      options = options.merge!(:content => content, :pic => File.open(image_path, "rb")).to_options
      upload("http://api.kaixin001.com/records/add.json", options)
    end



  end
end